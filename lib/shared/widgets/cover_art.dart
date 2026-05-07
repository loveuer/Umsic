import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/cache_manager.dart';

class CoverArtImage extends ConsumerWidget {
  const CoverArtImage({
    super.key,
    required this.url,
    this.size,
    this.borderRadius = 8,
  });

  final String? url;
  final double? size;
  final double borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imgMgr = ref.watch(imageCacheManagerProvider);

    Widget buildPlaceholder(BuildContext ctx) => ColoredBox(
          color: Theme.of(ctx).colorScheme.surfaceContainerHighest,
          child: Center(
            child: Icon(
              Icons.music_note,
              size: size != null ? size! * 0.5 : 24,
              color: Theme.of(ctx).colorScheme.onSurfaceVariant,
            ),
          ),
        );

    final Widget content;
    if (url == null) {
      content = buildPlaceholder(context);
    } else {
      content = CachedNetworkImage(
        imageUrl: url!,
        cacheManager: imgMgr,
        fit: BoxFit.cover,
        placeholder: (ctx, _) => buildPlaceholder(ctx),
        errorWidget: (ctx, _, err) => buildPlaceholder(ctx),
      );
    }

    // Wrap with a fixed SizedBox so placeholder and loaded image always occupy
    // exactly the same space, preventing layout reflow on image load.
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: size != null
          ? SizedBox(width: size, height: size, child: content)
          : SizedBox.expand(child: content),
    );
  }
}
