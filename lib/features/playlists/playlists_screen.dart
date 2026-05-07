import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/navidrome_client.dart';
import '../../core/audio/player_controller.dart';
import '../../shared/widgets/cover_art.dart';
import '../../shared/widgets/song_list_tile.dart';
import 'playlists_provider.dart';

class PlaylistsScreen extends ConsumerWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('歌单')),
      body: playlistsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (playlists) {
          final clientAsync = ref.watch(navidromeClientProvider);
          return ListView.builder(
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final pl = playlists[index];
              final isFavorites = pl.id == kFavoritesId;
              final coverUrl = pl.coverArt != null
                  ? clientAsync.valueOrNull?.coverArtUrl(pl.coverArt!, size: 100)
                  : null;
              return ListTile(
                leading: isFavorites
                    ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : CoverArtImage(url: coverUrl, size: 48),
                title: Text(pl.name),
                subtitle: pl.songCount != null ? Text('${pl.songCount} 首') : null,
                onTap: () => context.push('/playlists/${pl.id}'),
              );
            },
          );
        },
      ),
    );
  }
}

// ─── Playlist Detail ───────────────────────────────────────────────────────────

class PlaylistDetailScreen extends ConsumerWidget {
  const PlaylistDetailScreen({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(playlistDetailProvider(playlistId));

    return detailAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
      data: (detail) {
        final isFavorites = playlistId == kFavoritesId;
        final clientAsync = ref.watch(navidromeClientProvider);
        final coverUrl = detail.coverArt != null
            ? clientAsync.valueOrNull?.coverArtUrl(detail.coverArt!, size: 600)
            : null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(detail.name),
                  background: isFavorites
                      ? Container(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          child: Icon(
                            Icons.favorite,
                            size: 96,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )
                      : CoverArtImage(url: coverUrl, borderRadius: 0),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Row(
                    children: [
                      Text('${detail.entries.length} 首歌曲',
                          style: Theme.of(context).textTheme.bodySmall),
                      const Spacer(),
                      if (detail.entries.isNotEmpty)
                        FilledButton.icon(
                          onPressed: () => ref
                              .read(playerControllerProvider.notifier)
                              .playSongs(detail.entries),
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('播放全部'),
                        ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final song = detail.entries[index];
                    final coverArtUrl = song.coverArt != null
                        ? clientAsync.valueOrNull?.coverArtUrl(song.coverArt!, size: 100)
                        : null;
                    return SongListTile(
                      song: song,
                      coverArtUrl: coverArtUrl,
                      showIndex: index + 1,
                      onTap: () => ref
                          .read(playerControllerProvider.notifier)
                          .playSongs(detail.entries, startIndex: index),
                    );
                  },
                  childCount: detail.entries.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
