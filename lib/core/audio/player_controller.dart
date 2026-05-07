import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/models/subsonic_models.dart';
import '../api/navidrome_client.dart';
import 'audio_handler.dart';

part 'player_controller.g.dart';

@Riverpod(keepAlive: true)
MusicAudioHandler audioHandler(AudioHandlerRef ref) {
  throw UnimplementedError('audioHandler must be overridden in main via ProviderScope overrides');
}

/// Current playback queue (Song objects)
@Riverpod(keepAlive: true)
class PlayerQueue extends _$PlayerQueue {
  @override
  List<Song> build() => [];

  void setQueue(List<Song> songs) => state = songs;
  void clear() => state = [];
}

/// Current index in queue
@Riverpod(keepAlive: true)
class CurrentIndex extends _$CurrentIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

/// Helper provider to play a list of songs starting at index
@riverpod
class PlayerController extends _$PlayerController {
  @override
  void build() {}

  Future<void> playSongs(
    List<Song> songs, {
    int startIndex = 0,
  }) async {
    final handler = ref.read(audioHandlerProvider);
    final client = await ref.read(navidromeClientProvider.future);

    final streamUrls = songs.map((s) => client.streamUrl(s.id)).toList();
    final coverUrls = songs
        .map((s) => s.coverArt != null ? client.coverArtUrl(s.coverArt!) : null)
        .toList();

    ref.read(playerQueueProvider.notifier).setQueue(songs);
    ref.read(currentIndexProvider.notifier).set(startIndex);

    await handler.setQueueFromSongs(
      songs,
      streamUrls,
      coverArtUrls: coverUrls,
      initialIndex: startIndex,
    );
    await handler.play();
  }

  Future<void> playOne(Song song) => playSongs([song]);
}
