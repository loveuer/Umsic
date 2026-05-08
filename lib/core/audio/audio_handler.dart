import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import '../api/models/subsonic_models.dart';

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

class MusicAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
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
    String streamUrl,
  ) async {
    await _ensureCacheDir();

    final cacheFile = File('${_cacheDir.path}/${song.id}');
    if (await cacheFile.exists()) {
      // Cache hit — play from local file instantly.
      return AudioSource.uri(cacheFile.uri);
    }
    // Cache miss — stream while caching to a file named by song ID.
    // Uses exactly 1× file bandwidth and persists across sessions.
    // ignore: experimental_member_use
    return LockCachingAudioSource(
      Uri.parse(streamUrl),
      cacheFile: File('${_cacheDir.path}/${song.id}'),
    );
  }

  Future<void> setQueueFromSongs(
    List<Song> songs,
    List<String> streamUrls, {
    List<String?>? coverArtUrls,
    int initialIndex = 0,
  }) async {
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
        (i) => _resolveAudioSource(songs[i], streamUrls[i]),
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
