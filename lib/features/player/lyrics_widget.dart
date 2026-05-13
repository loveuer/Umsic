import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/audio/player_controller.dart';

class LyricsWidget extends ConsumerWidget {
  const LyricsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lyricsAsync = ref.watch(songLyricsProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
      child: Center(
        child: lyricsAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text(
            '加载歌词失败',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          data: (lyricsList) {
            if (lyricsList.isEmpty) {
              return Text(
                '暂无歌词',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              );
            }

            final lyrics = lyricsList.firstWhere(
              (l) => l.synced && l.line.isNotEmpty,
              orElse: () => lyricsList.first,
            );

            if (lyrics.synced) {
              return _SyncedLyricsView(lyrics: lyrics);
            }

            return _UnsyncedLyricsView(lyrics: lyrics);
          },
        ),
      ),
    );
  }
}

class _SyncedLyricsView extends ConsumerStatefulWidget {
  const _SyncedLyricsView({required this.lyrics});
  final StructuredLyrics lyrics;

  @override
  ConsumerState<_SyncedLyricsView> createState() => _SyncedLyricsViewState();
}

class _SyncedLyricsViewState extends ConsumerState<_SyncedLyricsView> {
  final _scrollController = ScrollController();
  int _currentLineIndex = 0;

  @override
  void initState() {
    super.initState();
    _lineKeys = List.generate(widget.lyrics.line.length, (_) => GlobalKey());
    _startPositionTracking();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startPositionTracking() {
    final handler = ref.read(audioHandlerProvider);
    handler.player.positionStream.listen((position) {
      final lines = widget.lyrics.line;
      int activeIdx = 0;
      for (var i = 0; i < lines.length; i++) {
        if (position.inMilliseconds >= lines[i].start) {
          activeIdx = i;
        } else {
          break;
        }
      }
      if (activeIdx != _currentLineIndex && mounted) {
        setState(() => _currentLineIndex = activeIdx);
        _scrollToLine(activeIdx);
      }
    });
  }

  void _scrollToLine(int index) {
    if (!_scrollController.hasClients) return;
    final context = _lineKeys[index].currentContext;
    if (context == null) return;

    // Use Scrollable.ensureVisible with alignment 0.5 to center the line
    Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  late final List<GlobalKey> _lineKeys;

  @override
  Widget build(BuildContext context) {
    final lines = widget.lyrics.line;
    final theme = Theme.of(context);

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 120),
      itemCount: lines.length,
      itemBuilder: (context, i) {
        final isCurrent = i == _currentLineIndex;
        return Padding(
          key: _lineKeys[i],
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Text(
            lines[i].value,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isCurrent
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant.withAlpha(128),
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
              fontSize: isCurrent ? 20 : 16,
            ),
          ),
        );
      },
    );
  }
}

class _UnsyncedLyricsView extends StatelessWidget {
  const _UnsyncedLyricsView({required this.lyrics});
  final StructuredLyrics lyrics;

  @override
  Widget build(BuildContext context) {
    final text = lyrics.line.map((l) => l.value).join('\n');
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.8,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}
