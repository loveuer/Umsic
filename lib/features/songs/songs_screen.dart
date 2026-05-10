import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/navidrome_client.dart';
import '../../core/audio/player_controller.dart';
import '../../shared/widgets/song_list_tile.dart';
import 'songs_provider.dart';

class SongsScreen extends ConsumerWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final songsAsync = ref.watch(songsProvider);

    return Scaffold(
      body: songsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorView(error: e, onRetry: () => ref.invalidate(songsProvider)),
        data: (songs) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(songsProvider),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Row(
                    children: [
                      Text(
                        '${songs.length} 首歌曲',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      FilledButton.icon(
                        onPressed: songs.isEmpty
                            ? null
                            : () => ref
                                .read(playerControllerProvider.notifier)
                                .playSongs(songs),
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
                    final song = songs[index];
                    return Consumer(
                      builder: (context, ref, _) {
                        final clientAsync = ref.watch(navidromeClientProvider);
                        final coverUrl = clientAsync.valueOrNull?.coverArtUrl(
                          song.coverArt ?? '',
                          size: 100,
                        );
                        return SongListTile(
                          song: song,
                          coverArtUrl: song.coverArt != null ? coverUrl : null,
                          showDownloadAction: true,
                          onTap: () => ref
                              .read(playerControllerProvider.notifier)
                              .playSongs(songs, startIndex: index),
                        );
                      },
                    );
                  },
                  childCount: songs.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});
  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(error.toString(), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('重试')),
          ],
        ),
      ),
    );
  }
}
