import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
import 'playlists_provider.dart';

/// Bottom sheet that lists playlists to add a song to.
/// Includes a "新歌单" option to create a new playlist on the fly.
class AddToPlaylistSheet extends ConsumerWidget {
  const AddToPlaylistSheet({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.85,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              // Handle bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(80),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  children: [
                    Text('添加到歌单', style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('新建歌单'),
                      onPressed: () => _createNewPlaylist(context, ref),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: playlistsAsync.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('加载失败：$e')),
                  data: (playlists) => ListView.builder(
                    controller: scrollController,
                    itemCount: playlists.length,
                    itemBuilder: (context, i) {
                      final pl = playlists[i];
                      // Skip favorites — songs can't be manually added there
                      final isFavorites = pl.id == kFavoritesId;

                      return ListTile(
                        leading: Icon(
                          isFavorites ? Icons.favorite : Icons.queue_music,
                          color: isFavorites
                              ? Theme.of(context).colorScheme.error
                              : null,
                        ),
                        title: Text(pl.name),
                        subtitle: Text('${pl.songCount ?? 0} 首'),
                        enabled: !isFavorites,
                        onTap: isFavorites
                            ? null
                            : () async {
                          Navigator.of(context).pop();
                          try {
                            await ref
                                .read(playlistMutationsProvider.notifier)
                                .addToPlaylist(pl.id, song.id);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('已添加到「${pl.name}」')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('添加失败：$e')),
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _createNewPlaylist(BuildContext context, WidgetRef ref) async {
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
      await ref
          .read(playlistMutationsProvider.notifier)
          .addToPlaylist(playlist.id, song.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已创建「$name」并添加歌曲')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('创建失败：$e')),
        );
      }
    }
  }
}
