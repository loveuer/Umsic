import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/audio/audio_handler.dart';
import '../../core/audio/player_controller.dart';
import '../../features/playlists/playlists_provider.dart';
import '../../shared/widgets/cover_art.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.watch(audioHandlerProvider);
    final playMode = ref.watch(playModeNotifierProvider);
    final queue = ref.watch(playerQueueProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: StreamBuilder<MediaItem?>(
        stream: handler.mediaItem,
        builder: (context, mediaSnap) {
          final media = mediaSnap.data;

          return StreamBuilder<int?>(
            stream: handler.player.currentIndexStream,
            builder: (context, idxSnap) {
              final currentIdx =
                  idxSnap.data ?? handler.player.currentIndex ?? -1;
              final currentSongId =
                  (currentIdx >= 0 && currentIdx < queue.length)
                      ? queue[currentIdx].id
                      : null;

              return StreamBuilder<PlaybackState>(
                stream: handler.playbackState,
                builder: (context, stateSnap) {
                  final state = stateSnap.data;
                  final playing = state?.playing ?? false;
                  final processingState = state?.processingState;

                  return Column(
                    children: [
                      // Cover art
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 80, 32, 16),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CoverArtImage(
                                url: media?.artUri?.toString(),
                                borderRadius: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Title / Artist + Favorite
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // SizedBox.expand forces Stack to full available width
                              // so Positioned(right:0) lands at the true right edge
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      media?.title ?? '未播放',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      media?.artist ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              // Heart button at the right edge, doesn't affect text centering
                              Positioned(
                                right: 0,
                                child: _FavoriteButton(songId: currentSongId),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Progress bar
                      _ProgressBar(
                        player: handler.player,
                        mediaStream: handler.mediaItem,
                        onSeek: handler.seek,
                      ),

                      // Controls
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              iconSize: 36,
                              icon: const Icon(Icons.skip_previous),
                              onPressed: handler.skipToPrevious,
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20),
                              ),
                              onPressed: () {
                                if (processingState ==
                                    AudioProcessingState.completed) {
                                  handler.seek(Duration.zero);
                                  handler.play();
                                } else {
                                  playing ? handler.pause() : handler.play();
                                }
                              },
                              child: Icon(
                                processingState ==
                                            AudioProcessingState.loading ||
                                        processingState ==
                                            AudioProcessingState.buffering
                                    ? Icons.hourglass_top
                                    : playing
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                size: 36,
                              ),
                            ),
                            IconButton(
                              iconSize: 36,
                              icon: const Icon(Icons.skip_next),
                              onPressed: handler.skipToNext,
                            ),
                          ],
                        ),
                      ),

                      // Play mode + queue row
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Play mode cycle button
                            IconButton(
                              tooltip: switch (playMode) {
                                PlayMode.sequence => '顺序播放',
                                PlayMode.loop => '列表循环',
                                PlayMode.shuffle => '随机播放',
                              },
                              icon: Icon(
                                switch (playMode) {
                                  PlayMode.sequence => Icons.repeat,
                                  PlayMode.loop => Icons.repeat,
                                  PlayMode.shuffle => Icons.shuffle,
                                },
                                color: switch (playMode) {
                                  PlayMode.sequence => Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                      .withAlpha(128),
                                  PlayMode.loop ||
                                  PlayMode.shuffle =>
                                    Theme.of(context).colorScheme.primary,
                                },
                              ),
                              onPressed: () =>
                                  ref.read(playModeNotifierProvider.notifier).cycle(),
                            ),

                            // Queue button
                            IconButton(
                              tooltip: '播放列表 (${queue.length})',
                              icon: const Icon(Icons.queue_music),
                              onPressed: queue.isEmpty
                                  ? null
                                  : () => showModalBottomSheet<void>(
                                        context: context,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        builder: (_) => _QueueBottomSheet(
                                          handler: handler,
                                          queue: queue,
                                        ),
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ─── Favorite Button ───────────────────────────────────────────────────────────

class _FavoriteButton extends ConsumerWidget {
  const _FavoriteButton({required this.songId});
  final String? songId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (songId == null) return const SizedBox.shrink();
    final starredIds = ref.watch(starredSongsProvider);
    final isStarred = starredIds.valueOrNull?.contains(songId) ?? false;

    return IconButton(
      iconSize: 28,
      icon: Icon(
        isStarred ? Icons.favorite : Icons.favorite_border,
        color: isStarred ? Theme.of(context).colorScheme.primary : null,
      ),
      onPressed: () =>
          ref.read(starredSongsProvider.notifier).toggle(songId!),
    );
  }
}

// ─── Queue Bottom Sheet ────────────────────────────────────────────────────────

class _QueueBottomSheet extends StatelessWidget {
  const _QueueBottomSheet({required this.handler, required this.queue});

  final MusicAudioHandler handler;
  final List<Song> queue;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Handle bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                width: 40,
                height: 4,
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
                  Text('播放列表', style: Theme.of(context).textTheme.titleMedium),
                  const Spacer(),
                  Text(
                    '${queue.length} 首',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: StreamBuilder<int?>(
                stream: handler.player.currentIndexStream,
                builder: (context, snap) {
                  final currentIdx = snap.data ?? -1;
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: queue.length,
                    itemBuilder: (context, i) {
                      final song = queue[i];
                      final isCurrent = i == currentIdx;
                      return ListTile(
                        selected: isCurrent,
                        selectedTileColor:
                            Theme.of(context).colorScheme.primaryContainer.withAlpha(80),
                        leading: isCurrent
                            ? Icon(Icons.volume_up,
                                color: Theme.of(context).colorScheme.primary)
                            : Text(
                                '${i + 1}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                              ),
                        title: Text(
                          song.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: isCurrent
                              ? TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                )
                              : null,
                        ),
                        subtitle: Text(
                          song.artist ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          handler.skipToQueueItem(i);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─── Progress Bar ──────────────────────────────────────────────────────────────

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    required this.player,
    required this.mediaStream,
    required this.onSeek,
  });

  final AudioPlayer player;
  final Stream<MediaItem?> mediaStream;
  final Future<void> Function(Duration) onSeek;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: player.positionStream,
      builder: (context, posSnap) {
        final position = posSnap.data ?? Duration.zero;

        return StreamBuilder<MediaItem?>(
          stream: mediaStream,
          builder: (context, mediaSnap) {
            final duration = mediaSnap.data?.duration ?? Duration.zero;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Slider(
                    value: duration.inSeconds > 0
                        ? position.inSeconds
                            .toDouble()
                            .clamp(0, duration.inSeconds.toDouble())
                        : 0,
                    max: duration.inSeconds > 0
                        ? duration.inSeconds.toDouble()
                        : 1,
                    onChanged: (v) => onSeek(Duration(seconds: v.toInt())),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(position),
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(_formatDuration(duration),
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
