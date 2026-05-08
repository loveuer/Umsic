import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/navidrome_client.dart';
import '../../core/audio/player_controller.dart';
import '../../shared/widgets/cover_art.dart';
import '../../shared/widgets/song_list_tile.dart';
import 'albums_provider.dart';

class AlbumsScreen extends ConsumerWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsAsync = ref.watch(albumsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('专辑')),
      body: albumsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (albums) {
          final clientAsync = ref.watch(navidromeClientProvider);
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(albumsProvider),
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                final coverUrl = album.coverArt != null
                    ? clientAsync.valueOrNull?.coverArtUrl(album.coverArt!, size: 300)
                    : null;
                return GestureDetector(
                  onTap: () => context.push('/albums/${album.id}'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CoverArtImage(url: coverUrl, borderRadius: 8),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        album.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        album.artist ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ─── Album Detail ──────────────────────────────────────────────────────────────

class AlbumDetailScreen extends ConsumerWidget {
  const AlbumDetailScreen({super.key, required this.albumId});

  final String albumId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumAsync = ref.watch(albumDetailProvider(albumId));

    return albumAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
      data: (album) {
        final clientAsync = ref.watch(navidromeClientProvider);
        final coverUrl = album.coverArt != null
            ? clientAsync.valueOrNull?.coverArtUrl(album.coverArt!, size: 600)
            : null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 280,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(album.name),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CoverArtImage(url: coverUrl, borderRadius: 0),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black54],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Row(
                    children: [
                      if (album.artist != null)
                        Text(
                          album.artist!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: () => ref
                            .read(playerControllerProvider.notifier)
                            .playSongs(album.song),
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
                    final song = album.song[index];
                    final coverArtUrl = song.coverArt != null
                        ? clientAsync.valueOrNull?.coverArtUrl(song.coverArt!, size: 100)
                        : null;
                    return SongListTile(
                      song: song,
                      coverArtUrl: coverArtUrl,
                      showIndex: index + 1,
                      onTap: () => ref
                          .read(playerControllerProvider.notifier)
                          .playSongs(album.song, startIndex: index),
                    );
                  },
                  childCount: album.song.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
