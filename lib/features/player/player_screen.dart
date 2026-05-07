import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/audio/player_controller.dart';
import '../../shared/widgets/cover_art.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.watch(audioHandlerProvider);

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

                  // Title / Artist
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            media?.title ?? '未播放',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            media?.artist ?? '',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
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
                            if (processingState == AudioProcessingState.completed) {
                              handler.seek(Duration.zero);
                              handler.play();
                            } else {
                              playing ? handler.pause() : handler.play();
                            }
                          },
                          child: Icon(
                            processingState == AudioProcessingState.loading ||
                                    processingState == AudioProcessingState.buffering
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
                ],
              );
            },
          );
        },
      ),
    );
  }
}

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
