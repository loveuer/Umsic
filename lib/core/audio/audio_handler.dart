import 'dart:convert';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:drift/drift.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/models/subsonic_models.dart';
import '../api/navidrome_client.dart';
import '../database/app_database.dart';
import '../storage/cache_manager.dart';
import 'single_download_cache_source.dart';

NavidromeClient? _clientForCache;

MediaItem songToMediaItem(Song song, String streamUrl, {String? coverArtUrl}) {
  return MediaItem(
    id: streamUrl,
    title: song.title,
    artist: song.artist,
    album: song.album,
    duration: song.duration != null ? Duration(seconds: song.duration!) : null,
    artUri: coverArtUrl != null ? Uri.parse(coverArtUrl) : null,
    extras: {'songId': song.id},
  );
}

/// Clean up stale `.part` cache files left over from interrupted downloads.
Future<void> _cleanStaleCacheFiles(Directory cacheDir) async {
  if (!await cacheDir.exists()) return;
  await for (final entity in cacheDir.list()) {
    if (entity is File && entity.path.endsWith('.part')) {
      try {
        await entity.delete();
      } catch (_) {}
    }
  }
}

/// Download cover art for a song and return the local file path.
Future<String?> _downloadCoverArt(String coverArtId, String url) async {
  try {
    final cachePath = '${(await getTemporaryDirectory()).path}/cover_art_cache/$coverArtId';
    final file = File(cachePath);
    if (await file.exists()) return cachePath;

    final partialFile = File('$cachePath.part');
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();
    if (response.statusCode != 200) {
      client.close();
      return null;
    }
    await partialFile.create(recursive: true);
    final sink = partialFile.openWrite();
    await sink.addStream(response);
    await sink.flush();
    await sink.close();
    client.close();
    await partialFile.rename(cachePath);
    return cachePath;
  } catch (_) {
    return null;
  }
}

/// Serialize lyrics to JSON string for DB storage.
String? _serializeLyrics(List<StructuredLyrics> lyrics) {
  if (lyrics.isEmpty) return null;
  try {
    return jsonEncode(lyrics.map((l) => l.toJson()).toList());
  } catch (_) {
    return null;
  }
}

class MusicAudioHandler extends BaseAudioHandler
    with QueueHandler, SeekHandler {
  MusicAudioHandler() {
    _player.setLoopMode(LoopMode.all);
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    _player.currentIndexStream.listen((index) {
      if (index != null && index < queue.value.length) {
        mediaItem.add(queue.value[index]);
      }
    });
    _player.sequenceStream.listen((seq) {});
  }

  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  late Directory _cacheDir;
  bool _cacheInitialized = false;
  AppDatabase? _db;
  final Map<String, Song> _songById = {};

  void setDatabase(AppDatabase db) {
    _db = db;
  }

  /// Set the Navidrome client for background cover art / lyrics caching.
  void setClientForCache(NavidromeClient client) {
    _clientForCache = client;
  }

  /// The audio cache directory (available after first _ensureCacheDir call).
  Future<Directory> get cacheDir async {
    await _ensureCacheDir();
    return _cacheDir;
  }

  /// The cache file for a given song ID.
  Future<File> cacheFileForSong(String songId) async {
    await _ensureCacheDir();
    return File('${_cacheDir.path}/$songId');
  }

  Future<void> _ensureCacheDir() async {
    if (_cacheInitialized) return;
    final tempDir = await getTemporaryDirectory();
    _cacheDir = Directory('${tempDir.path}/audio_cache');
    if (!await _cacheDir.exists()) {
      await _cacheDir.create(recursive: true);
    }
    _cleanStaleCacheFiles(_cacheDir);
    _cacheInitialized = true;
  }

  Future<AudioSource> _resolveAudioSource(
    Song song,
    String streamUrl, {
    bool cacheWhileStreaming = false,
  }) async {
    await _ensureCacheDir();

    final cacheFile = File('${_cacheDir.path}/${song.id}');
    if (await cacheFile.exists()) {
      _touchCachedSong(song.id);
      return AudioSource.uri(cacheFile.uri);
    }

    if (cacheWhileStreaming) {
      return SingleDownloadCachingAudioSource(
        Uri.parse(streamUrl),
        cacheFile: cacheFile,
        onComplete: () => _onSongCached(song),
      );
    }

    // Non-current songs stream directly — avoids proxy overhead for the
    // entire queue. Background caching is triggered by _onSongChanged.
    return AudioSource.uri(Uri.parse(streamUrl));
  }

  Future<void> _onSongCached(Song song) async {
    if (_db == null) return;
    try {
      await _ensureCacheDir();
      final now = DateTime.now().millisecondsSinceEpoch;
      final cacheFile = File('${_cacheDir.path}/${song.id}');
      final fileExists = await cacheFile.exists();
      final fileSize = fileExists ? await cacheFile.length() : song.size;

      // Download cover art and lyrics in parallel
      String? coverPath;
      String? lyricsStr;
      if (song.coverArt != null && _clientForCache != null) {
        final artUrl = _clientForCache!.coverArtUrl(song.coverArt!, size: 300);
        coverPath = await _downloadCoverArt(song.coverArt!, artUrl);
      }
      if (_clientForCache != null) {
        final lyrics = await _clientForCache!.getLyrics(song.id);
        lyricsStr = _serializeLyrics(lyrics);
      }

      await _db!.insertOrUpdate(
        CachedSongsCompanion.insert(
          id: song.id,
          title: song.title,
          artist: Value(song.artist),
          artistId: Value(song.artistId),
          album: Value(song.album),
          albumId: Value(song.albumId),
          coverArt: Value(song.coverArt),
          coverArtPath: Value(coverPath),
          lyricsJson: Value(lyricsStr),
          duration: Value(song.duration),
          track: Value(song.track),
          year: Value(song.year),
          genre: Value(song.genre),
          contentType: Value(song.contentType),
          suffix: Value(song.suffix),
          size: Value(fileSize),
          bitRate: Value(song.bitRate),
          starred: Value(song.starred),
          cachedAt: now,
          lastAccessedAt: now,
          filePath: cacheFile.path,
        ),
      );
      _evictIfNeeded();
    } catch (_) {
      // Non-critical — cache file exists on disk, DB entry is just metadata
    }
  }

  void _touchCachedSong(String songId) async {
    if (_db == null) return;
    try {
      await _db!.updateLastAccessed(songId);
    } catch (_) {}
  }

  /// Manually download a song for offline playback.
  Future<void> cacheSong(Song song, String streamUrl) async {
    await _ensureCacheDir();
    final cacheFile = File('${_cacheDir.path}/${song.id}');
    if (await cacheFile.exists()) {
      // Already cached on disk — just ensure DB entry
      await _onSongCachedWithFlag(song, isDownload: true);
      return;
    }

    // Direct HTTP download — no just_audio proxy needed.
    final partialFile = File('${cacheFile.path}.part');
    try {
      final client = HttpClient();
      final request = await client.getUrl(Uri.parse(streamUrl));
      final response = await request.close();
      if (response.statusCode != 200) {
        client.close();
        throw Exception('HTTP ${response.statusCode}');
      }
      await partialFile.create(recursive: true);
      final sink = partialFile.openWrite();
      await sink.addStream(response);
      await sink.flush();
      await sink.close();
      client.close();
      await partialFile.rename(cacheFile.path);
      await _onSongCachedWithFlag(song, isDownload: true);
    } catch (_) {
      if (await partialFile.exists()) await partialFile.delete();
      rethrow;
    }
  }

  Future<void> _onSongCachedWithFlag(Song song, {bool isDownload = false}) async {
    if (_db == null) return;
    try {
      await _ensureCacheDir();
      final now = DateTime.now().millisecondsSinceEpoch;
      final cacheFile = File('${_cacheDir.path}/${song.id}');
      final fileExists = await cacheFile.exists();
      final fileSize = fileExists ? await cacheFile.length() : song.size;

      // Download cover art and lyrics in parallel
      String? coverPath;
      String? lyricsStr;
      if (song.coverArt != null && _clientForCache != null) {
        final artUrl = _clientForCache!.coverArtUrl(song.coverArt!, size: 300);
        coverPath = await _downloadCoverArt(song.coverArt!, artUrl);
      }
      if (_clientForCache != null) {
        final lyrics = await _clientForCache!.getLyrics(song.id);
        lyricsStr = _serializeLyrics(lyrics);
      }

      await _db!.insertOrUpdate(
        CachedSongsCompanion.insert(
          id: song.id,
          title: song.title,
          artist: Value(song.artist),
          artistId: Value(song.artistId),
          album: Value(song.album),
          albumId: Value(song.albumId),
          coverArt: Value(song.coverArt),
          coverArtPath: Value(coverPath),
          lyricsJson: Value(lyricsStr),
          duration: Value(song.duration),
          track: Value(song.track),
          year: Value(song.year),
          genre: Value(song.genre),
          contentType: Value(song.contentType),
          suffix: Value(song.suffix),
          size: Value(fileSize),
          bitRate: Value(song.bitRate),
          starred: Value(song.starred),
          cachedAt: now,
          lastAccessedAt: now,
          filePath: cacheFile.path,
          isDownload: Value(isDownload),
        ),
      );
      _evictIfNeeded();
    } catch (_) {
      // Non-critical
    }
  }

  Future<void> _evictIfNeeded() async {
    if (_db == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final maxMb = prefs.getInt(kCacheMaxSizeMbKey) ?? kDefaultCacheMaxSizeMb;
      await evictCacheIfNeeded(_db!, maxMb * 1024 * 1024);
    } catch (_) {}
  }

  Future<void> setQueueFromSongs(
    List<Song> songs,
    List<String> streamUrls, {
    List<String?>? coverArtUrls,
    int initialIndex = 0,
  }) async {
    for (final song in songs) {
      _songById[song.id] = song;
    }

    final items = List.generate(songs.length, (i) {
      return songToMediaItem(
        songs[i],
        streamUrls[i],
        coverArtUrl: coverArtUrls?[i],
      );
    });
    queue.add(items);

    final sources = await Future.wait(
      List.generate(
        songs.length,
        (i) => _resolveAudioSource(
          songs[i],
          streamUrls[i],
          // Only the current song uses the caching source (1:1 traffic).
          // Other songs stream directly; _onSongChanged handles background caching.
          cacheWhileStreaming: i == initialIndex,
        ),
      ),
    );

    await _player.setAudioSources(sources, initialIndex: initialIndex);
    if (items.isNotEmpty) mediaItem.add(items[initialIndex]);
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToNext() => _player.seekToNext();

  @override
  Future<void> skipToPrevious() => _player.seekToPrevious();

  @override
  Future<void> skipToQueueItem(int index) async {
    await _player.seek(Duration.zero, index: index);
    await _player.play();
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) async {
    await _player.setShuffleModeEnabled(
      shuffleMode == AudioServiceShuffleMode.all,
    );
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    LoopMode loopMode;
    switch (repeatMode) {
      case AudioServiceRepeatMode.one:
        loopMode = LoopMode.one;
      case AudioServiceRepeatMode.all:
        loopMode = LoopMode.all;
      case _:
        loopMode = LoopMode.off;
    }
    await _player.setLoopMode(loopMode);
  }

  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.skipToNext,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: switch (_player.processingState) {
        ProcessingState.idle => AudioProcessingState.idle,
        ProcessingState.loading => AudioProcessingState.loading,
        ProcessingState.buffering => AudioProcessingState.buffering,
        ProcessingState.ready => AudioProcessingState.ready,
        ProcessingState.completed => AudioProcessingState.completed,
      },
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}
