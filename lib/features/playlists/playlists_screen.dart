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

  Future<void> _createPlaylist(BuildContext context, WidgetRef ref) async {
    final nameCtrl = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建歌单'),
        content: TextField(
          controller: nameCtrl,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '歌单名称',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, nameCtrl.text.trim()),
            child: const Text('创建'),
          ),
        ],
      ),
    );
    nameCtrl.dispose();
    if (name == null || name.isEmpty) return;

    try {
      final playlist = await ref
          .read(playlistMutationsProvider.notifier)
          .createPlaylist(name);
      if (context.mounted) context.push('/playlists/${playlist.id}');
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('创建失败：$e')),
        );
      }
    }
  }

  Future<void> _deletePlaylist(
      BuildContext context, WidgetRef ref, String id, String name) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('删除歌单'),
        content: Text('确定删除「$name」？此操作不可撤销。'),
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
    if (confirm != true) return;

    try {
      await ref.read(playlistMutationsProvider.notifier).deletePlaylist(id);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('删除失败：$e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('歌单')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createPlaylist(context, ref),
        child: const Icon(Icons.add),
      ),
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
                onLongPress: isFavorites
                    ? null
                    : () => _deletePlaylist(context, ref, pl.id, pl.name),
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
                    final tile = SongListTile(
                      song: song,
                      coverArtUrl: coverArtUrl,
                      showIndex: index + 1,
                      onTap: () => ref
                          .read(playerControllerProvider.notifier)
                          .playSongs(detail.entries, startIndex: index),
                    );
                    if (isFavorites) return tile;
                    return Dismissible(
                      key: ValueKey(song.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 24),
                        color: Theme.of(context).colorScheme.error,
                        child: Icon(Icons.delete,
                            color: Theme.of(context).colorScheme.onError),
                      ),
                      confirmDismiss: (_) async {
                        return showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('移除歌曲'),
                            content: Text('确定从「${detail.name}」中移除「${song.title}」？'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('移除'),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (_) {
                        ref
                            .read(playlistMutationsProvider.notifier)
                            .removeFromPlaylist(playlistId, index);
                      },
                      child: tile,
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
