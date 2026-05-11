import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/audio/player_controller.dart';
import '../../features/playlists/add_to_playlist_sheet.dart';
import '../../features/playlists/playlists_provider.dart';
import 'cover_art.dart';

class SongListTile extends ConsumerWidget {
  const SongListTile({
    super.key,
    required this.song,
    required this.coverArtUrl,
    this.localCoverArtPath,
    this.onTap,
    this.trailing,
    this.showIndex,
    this.showDownloadAction = false,
  });

  final Song song;
  final String? coverArtUrl;
  final String? localCoverArtPath;
  final VoidCallback? onTap;
  final Widget? trailing;
  final int? showIndex;
  final bool showDownloadAction;

  void _showContextMenu(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.playlist_add),
              title: const Text('添加到歌单'),
              onTap: () {
                Navigator.pop(ctx);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => AddToPlaylistSheet(song: song),
                );
              },
            ),
            const Divider(height: 1),
            Consumer(
              builder: (context, ref, _) {
                final cachedAsync = ref.watch(isSongCachedProvider(song.id));
                final isCached = cachedAsync.valueOrNull ?? false;
                if (isCached) return const SizedBox.shrink();
                return ListTile(
                  leading: const Icon(Icons.download_outlined),
                  title: const Text('下载'),
                  onTap: () {
                    Navigator.pop(ctx);
                    ref.read(downloadManagerProvider.notifier).downloadSong(song);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: showIndex != null
          ? SizedBox(
              width: 40,
              child: Center(
                child: Text(
                  '$showIndex',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
            )
          : CoverArtImage(url: coverArtUrl, localPath: localCoverArtPath, size: 48),
      title: Text(song.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        [song.artist, song.album].where((e) => e != null && e.isNotEmpty).join(' · '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: trailing ?? _buildTrailing(context, ref),
      onTap: onTap,
      onLongPress: () => _showContextMenu(context, ref),
    );
  }

  Widget _buildTrailing(BuildContext context, WidgetRef ref) {
    final starredAsync = ref.watch(starredSongsProvider);
    final isStarred = starredAsync.valueOrNull?.contains(song.id) ?? song.starred;

    final cachedAsync = showDownloadAction
        ? ref.watch(isSongCachedProvider(song.id))
        : null;
    final isCached = cachedAsync?.valueOrNull ?? false;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDownloadAction)
          SizedBox(
            width: 40,
            height: 40,
            child: isCached
                ? Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.download_outlined, size: 20),
                    onPressed: () async {
                      try {
                        await ref.read(downloadManagerProvider.notifier).downloadSong(song);
                        if (ref.context.mounted) {
                          ScaffoldMessenger.of(ref.context).showSnackBar(
                            SnackBar(content: Text('「${song.title}」已下载')),
                          );
                        }
                      } catch (e) {
                        if (ref.context.mounted) {
                          ScaffoldMessenger.of(ref.context).showSnackBar(
                            SnackBar(content: Text('下载失败：$e')),
                          );
                        }
                      }
                    },
                  ),
          ),
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert, size: 20),
            tooltip: '更多',
            onPressed: () => _showContextMenu(context, ref),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              isStarred ? Icons.favorite : Icons.favorite_border,
              size: 20,
              color: isStarred ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () => ref.read(starredSongsProvider.notifier).toggle(song.id),
          ),
        ),
      ],
    );
  }
}
