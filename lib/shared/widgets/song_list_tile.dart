import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
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
  });

  final Song song;
  final String? coverArtUrl;
  final VoidCallback? onTap;
  final Widget? trailing;
  final int? showIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starredAsync = ref.watch(starredSongsProvider);
    final isStarred = starredAsync.valueOrNull?.contains(song.id) ?? song.starred;

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
      trailing: trailing ??
          IconButton(
            icon: Icon(
              isStarred ? Icons.favorite : Icons.favorite_border,
              color: isStarred ? Theme.of(context).colorScheme.primary : null,
            ),
            onPressed: () => ref.read(starredSongsProvider.notifier).toggle(song.id),
          ),
      onTap: onTap,
    );
  }
}
