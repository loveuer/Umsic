import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';

part 'playlists_provider.g.dart';

const kFavoritesId = '__favorites__';

@riverpod
Future<List<Playlist>> playlists(PlaylistsRef ref) async {
  final client = await ref.watch(navidromeClientProvider.future);
  final list = await client.getPlaylists();
  // Prepend virtual "我的最爱" playlist
  const favorites = Playlist(id: kFavoritesId, name: '我的最爱');
  return [favorites, ...list];
}

@riverpod
Future<PlaylistDetail> playlistDetail(PlaylistDetailRef ref, String id) async {
  final client = await ref.watch(navidromeClientProvider.future);
  if (id == kFavoritesId) {
    final starred = await client.getStarred2();
    return PlaylistDetail(
      id: kFavoritesId,
      name: '我的最爱',
      songCount: starred.song.length,
      entries: starred.song,
    );
  }
  return client.getPlaylist(id);
}

// ─── Playlist Mutations ──────────────────────────────────────────────────────

@riverpod
class PlaylistMutations extends _$PlaylistMutations {
  @override
  void build() {}

  Future<Playlist> createPlaylist(String name) async {
    final client = await ref.read(navidromeClientProvider.future);
    final playlist = await client.createPlaylist(name: name);
    ref.invalidate(playlistsProvider);
    return playlist;
  }

  Future<void> addToPlaylist(String playlistId, String songId) async {
    final client = await ref.read(navidromeClientProvider.future);
    await client.updatePlaylist(playlistId, songIdsToAdd: [songId]);
    ref.invalidate(playlistDetailProvider(playlistId));
    ref.invalidate(playlistsProvider);
  }

  Future<void> removeFromPlaylist(String playlistId, int songIndex) async {
    final client = await ref.read(navidromeClientProvider.future);
    await client.updatePlaylist(playlistId, songIndexesToRemove: [songIndex]);
    ref.invalidate(playlistDetailProvider(playlistId));
    ref.invalidate(playlistsProvider);
  }

  Future<void> deletePlaylist(String playlistId) async {
    final client = await ref.read(navidromeClientProvider.future);
    await client.deletePlaylist(playlistId);
    ref.invalidate(playlistsProvider);
  }
}

// ─── Starred Songs ───────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
class StarredSongs extends _$StarredSongs {
  @override
  Future<Set<String>> build() async {
    final client = await ref.watch(navidromeClientProvider.future);
    final starred = await client.getStarred2();
    return starred.song.map((s) => s.id).toSet();
  }

  Future<void> toggle(String songId) async {
    final current = Set<String>.from(await future);
    final isStarred = current.contains(songId);

    // Optimistic update
    state = AsyncData(
      isStarred ? (current..remove(songId)) : (current..add(songId)),
    );

    final client = await ref.read(navidromeClientProvider.future);
    try {
      if (isStarred) {
        await client.unstar(songId);
      } else {
        await client.star(songId);
      }
      // Refresh favorites playlist
      ref.invalidate(playlistDetailProvider(kFavoritesId));
    } catch (_) {
      // Revert on failure
      state = AsyncData(current);
    }
  }
}
