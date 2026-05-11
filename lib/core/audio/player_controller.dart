import 'dart:convert';

import 'package:audio_service/audio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api/models/subsonic_models.dart';
import '../api/navidrome_client.dart';
import '../database/database_provider.dart';
import 'audio_handler.dart';

part 'player_controller.g.dart';

enum PlayMode {
  sequence, // 顺序播放 — play through once, stop
  loop,     // 列表循环 — repeat all
  shuffle,  // 随机播放 — shuffle + repeat all
}

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

/// Current index in queue — auto-synced from the player's currentIndexStream.
@Riverpod(keepAlive: true)
class CurrentIndex extends _$CurrentIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

/// Play mode — sequence / loop / shuffle
@Riverpod(keepAlive: true)
class PlayModeNotifier extends _$PlayModeNotifier {
  @override
  PlayMode build() => PlayMode.loop;

  Future<void> setMode(PlayMode mode) async {
    state = mode;
    final handler = ref.read(audioHandlerProvider);
    switch (mode) {
      case PlayMode.sequence:
        await handler.setRepeatMode(AudioServiceRepeatMode.none);
        await handler.setShuffleMode(AudioServiceShuffleMode.none);
      case PlayMode.loop:
        await handler.setRepeatMode(AudioServiceRepeatMode.all);
        await handler.setShuffleMode(AudioServiceShuffleMode.none);
      case PlayMode.shuffle:
        await handler.setRepeatMode(AudioServiceRepeatMode.all);
        await handler.setShuffleMode(AudioServiceShuffleMode.all);
    }
  }

  Future<void> cycle() async {
    await setMode(switch (state) {
      PlayMode.sequence => PlayMode.loop,
      PlayMode.loop => PlayMode.shuffle,
      PlayMode.shuffle => PlayMode.sequence,
    });
  }
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

    // Ensure handler has client for cover art / lyrics caching
    handler.setClientForCache(client);

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

  Future<void> playOne(Song song) async {
    final handler = ref.read(audioHandlerProvider);
    final client = await ref.read(navidromeClientProvider.future);
    handler.setClientForCache(client);
    return playSongs([song]);
  }
}

/// Download manager — keepAlive so downloads survive navigation.
@Riverpod(keepAlive: true)
class DownloadManager extends _$DownloadManager {
  @override
  void build() {}

  Future<void> downloadSong(Song song) async {
    final handler = ref.read(audioHandlerProvider);
    try {
      final client = await ref.read(navidromeClientProvider.future);
      handler.setClientForCache(client);
      await handler.cacheSong(song, client.streamUrl(song.id));
    } catch (e) {
      // Will be caught by the caller for UI feedback
      rethrow;
    }
  }
}

/// Whether a song is currently cached locally — watches DB reactively.
@riverpod
Stream<bool> isSongCached(IsSongCachedRef ref, String songId) async* {
  final db = ref.watch(appDatabaseProvider);
  yield* db.watchAll().map((rows) => rows.any((r) => r.id == songId));
}

/// Current song's lyrics — checks cached DB entry first, falls back to network.
@riverpod
Future<List<StructuredLyrics>> songLyrics(SongLyricsRef ref) async {
  final queue = ref.watch(playerQueueProvider);
  final idx = ref.watch(currentIndexProvider);
  if (queue.isEmpty || idx < 0 || idx >= queue.length) return [];
  final song = queue[idx];

  // Check DB for cached lyrics first
  final db = ref.watch(appDatabaseProvider);
  final cached = await db.getById(song.id);
  if (cached?.lyricsJson != null) {
    try {
      final list = (jsonDecode(cached!.lyricsJson!) as List)
          .map((e) => StructuredLyrics.fromJson(e as Map<String, dynamic>))
          .toList();
      return list;
    } catch (_) {
      // Fall through to network if decode fails
    }
  }

  final client = await ref.read(navidromeClientProvider.future);
  return client.getLyrics(song.id);
}
