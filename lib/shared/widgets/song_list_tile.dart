import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/audio/player_controller.dart';
import '../../features/playlists/playlists_provider.dart';
import 'cover_art.dart';

class SongListTile extends ConsumerWidget {
  const SongListTile({
    super.key,
    required this.song,
    required this.coverArtUrl,
    this.onTap,
    this.trailing,
    this.showIndex,
    this.showDownloadAction = false,
  });

  final Song song;
  final String? coverArtUrl;
  final VoidCallback? onTap;
  final Widget? trailing;
  final int? showIndex;
  final bool showDownloadAction;

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
          : CoverArtImage(url: coverArtUrl, size: 48),
      title: Text(song.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(
        [song.artist, song.album].where((e) => e != null && e.isNotEmpty).join(' · '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: trailing ?? _buildTrailing(context, ref),
      onTap: onTap,
    );
  }

  Widget _buildTrailing(BuildContext context, WidgetRef ref) {
    final starredAsync = ref.watch(starredSongsProvider);
    final isStarred = starredAsync.valueOrNull?.contains(song.id) ?? song.starred;

    if (!showDownloadAction) {
      return IconButton(
        icon: Icon(
          isStarred ? Icons.favorite : Icons.favorite_border,
          color: isStarred ? Theme.of(context).colorScheme.primary : null,
        ),
        onPressed: () => ref.read(starredSongsProvider.notifier).toggle(song.id),
      );
    }

    final cachedAsync = ref.watch(isSongCachedProvider(song.id));
    final isCached = cachedAsync.valueOrNull ?? false;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
