import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';
import '../../core/database/app_database.dart';
import '../../shared/widgets/song_list_tile.dart';
import 'downloads_provider.dart';

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

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsync = ref.watch(cachedSongsProvider);

    return Scaffold(
      body: songsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48),
                const SizedBox(height: 12),
                Text(e.toString(), textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(cachedSongsProvider),
                  child: const Text('重试'),
                ),
              ],
            ),
          ),
        ),
        data: (cachedSongs) {
          if (cachedSongs.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.download_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '还没有下载歌曲',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '播放歌曲时会自动缓存，也可手动下载',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(cachedSongsProvider),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Row(
                      children: [
                        Text(
                          '${cachedSongs.length} 首已缓存',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        FilledButton.icon(
                          onPressed: cachedSongs.isEmpty
                              ? null
                              : () {
                                  final songs = cachedSongs
                                      .map(_toSong)
                                      .toList();
                                  ref
                                      .read(downloadsPlayerProvider.notifier)
                                      .playCachedSongs(songs);
                                },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('全部播放'),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final cached = cachedSongs[index];
                      final song = _toSong(cached);
                      return Consumer(
                        builder: (context, ref, _) {
                          final clientAsync = ref.watch(navidromeClientProvider);
                          final coverUrl = clientAsync.valueOrNull?.coverArtUrl(
                            cached.coverArt ?? '',
                            size: 100,
                          );
                          return Dismissible(
                            key: ValueKey(cached.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 24),
                              color: Theme.of(context).colorScheme.error,
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.onError,
                              ),
                            ),
                            confirmDismiss: (_) async {
                              return showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('删除缓存'),
                                  content: Text('确定删除「${cached.title}」的缓存？'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, false),
                                      child: const Text('取消'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(ctx, true),
                                      child: const Text('删除'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            onDismissed: (_) {
                              ref
                                  .read(deleteCachedSongProvider(cached.id).notifier)
                                  .delete();
                            },
                            child: SongListTile(
                              song: song,
                              coverArtUrl: cached.coverArt != null ? coverUrl : null,
                              localCoverArtPath: cached.coverArtPath,
                              onTap: () {
                                final songs = cachedSongs.map(_toSong).toList();
                                ref
                                    .read(downloadsPlayerProvider.notifier)
                                    .playCachedSongs(songs, startIndex: index);
                              },
                            ),
                          );
                        },
                      );
                    },
                    childCount: cachedSongs.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
