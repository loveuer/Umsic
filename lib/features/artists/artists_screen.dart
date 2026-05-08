import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/navidrome_client.dart';
import '../../shared/widgets/cover_art.dart';
import 'artists_provider.dart';

class ArtistsScreen extends ConsumerWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistsAsync = ref.watch(artistsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('歌手')),
      body: artistsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (artists) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(artistsProvider),
          child: ListView.builder(
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final artist = artists[index];
              final clientAsync = ref.watch(navidromeClientProvider);
              final coverUrl = artist.coverArt != null
                  ? clientAsync.valueOrNull?.coverArtUrl(artist.coverArt!, size: 100)
                  : null;
              return ListTile(
                leading: CoverArtImage(url: coverUrl, size: 48),
                title: Text(artist.name),
                subtitle: artist.albumCount != null
                    ? Text('${artist.albumCount} 张专辑')
                    : null,
                onTap: () => context.push('/artists/${artist.id}'),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ─── Artist Detail Screen ─────────────────────────────────────────────────────

class ArtistDetailScreen extends ConsumerWidget {
  const ArtistDetailScreen({super.key, required this.artistId});

  final String artistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistAsync = ref.watch(artistDetailProvider(artistId));

    return artistAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
      data: (artist) {
        final clientAsync = ref.watch(navidromeClientProvider);
        final coverUrl = artist.coverArt != null
            ? clientAsync.valueOrNull?.coverArtUrl(artist.coverArt!, size: 300)
            : null;

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 240,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(artist.name),
                  background: coverUrl != null
                      ? CoverArtImage(url: coverUrl, borderRadius: 0)
                      : null,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final album = artist.album[index];
                      final albumCover = album.coverArt != null
                          ? clientAsync.valueOrNull?.coverArtUrl(album.coverArt!, size: 300)
                          : null;
                      return GestureDetector(
                        onTap: () => context.push('/albums/${album.id}'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CoverArtImage(url: albumCover, borderRadius: 8),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              album.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            if (album.year != null)
                              Text(
                                '${album.year}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                          ],
                        ),
                      );
                    },
                    childCount: artist.album.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
