import 'package:audio_service/audio_service.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:just_audio/just_audio.dart';

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

class MusicAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  MusicAudioHandler() {
    // Initialize with loop-all to match the default PlayMode.loop.
    // just_audio preserves loopMode/shuffleMode across setAudioSources calls.
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

  /// Set this before playing to enable audio file caching.
  BaseCacheManager? cacheManager;

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
    final sources = List.generate(songs.length, (i) {
      if (cacheManager != null) {
        // LockCachingAudioSource caches the audio file during playback.
        // It uses DefaultCacheManager internally (just_audio 0.10.x).
        // ignore: experimental_member_use
        return LockCachingAudioSource(Uri.parse(streamUrls[i]));
      }
      return AudioSource.uri(Uri.parse(streamUrls[i]));
    });
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
    await _player.setShuffleModeEnabled(shuffleMode == AudioServiceShuffleMode.all);
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    await _player.setLoopMode(switch (repeatMode) {
      AudioServiceRepeatMode.one => LoopMode.one,
      AudioServiceRepeatMode.all => LoopMode.all,
      _ => LoopMode.off,
    });
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
