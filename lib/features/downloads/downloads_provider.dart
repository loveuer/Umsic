import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_provider.dart';
import '../../core/audio/player_controller.dart';

part 'downloads_provider.g.dart';

/// Watch all cached songs reactively via drift's built-in change notification.
@riverpod
Stream<List<Song>> cachedSongs(CachedSongsRef ref) async* {
  final db = ref.watch(appDatabaseProvider);
  yield* db.watchAll().map((rows) => rows.map(_toSong).toList());
}

@riverpod
class DeleteCachedSong extends _$DeleteCachedSong {
  @override
  Future<void> build(String songId) async {}

  Future<void> delete() async {
    final db = ref.read(appDatabaseProvider);
    final handler = ref.read(audioHandlerProvider);

    await db.deleteById(songId);
    final file = await handler.cacheFileForSong(songId);
    if (await file.exists()) await file.delete();
  }
}

/// Play cached songs from the downloads screen.
@riverpod
class DownloadsPlayer extends _$DownloadsPlayer {
  @override
  void build() {}

  Future<void> playCachedSongs(List<Song> songs, {int startIndex = 0}) async {
    final handler = ref.read(audioHandlerProvider);

    List<String> streamUrls;
    try {
      final client = await ref.read(navidromeClientProvider.future);
      streamUrls = songs.map((s) => client.streamUrl(s.id)).toList();
    } catch (_) {
      streamUrls = songs.map((s) => 'cached://${s.id}').toList();
    }

    final coverUrls = <String?>[];
    try {
      final client = await ref.read(navidromeClientProvider.future);
      for (final s in songs) {
        coverUrls.add(s.coverArt != null ? client.coverArtUrl(s.coverArt!) : null);
      }
    } catch (_) {
      coverUrls.addAll(List.filled(songs.length, null));
    }

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
}

Song _toSong(CachedSong row) {
  return Song(
    id: row.id,
    title: row.title,
    artist: row.artist,
    artistId: row.artistId,
    album: row.album,
    albumId: row.albumId,
    coverArt: row.coverArt,
    duration: row.duration,
    track: row.track,
    year: row.year,
    genre: row.genre,
    contentType: row.contentType,
    suffix: row.suffix,
    size: row.size,
    bitRate: row.bitRate,
    starred: row.starred,
  );
}
