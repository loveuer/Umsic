import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';
import '../../core/audio/player_controller.dart';
import '../../shared/widgets/cover_art.dart';
import '../../shared/widgets/song_list_tile.dart';

part 'search_screen.g.dart';

@riverpod
Future<SearchResult> searchQuery(SearchQueryRef ref, String query) async {
  if (query.trim().isEmpty) return const SearchResult();
  final client = await ref.watch(navidromeClientProvider.future);
  return client.search(query);
}

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: '搜索歌曲、歌手、专辑…',
            border: InputBorder.none,
            suffixIcon: _query.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      setState(() => _query = '');
                    },
                  )
                : null,
          ),
          onChanged: (v) => setState(() => _query = v),
          onSubmitted: (v) => setState(() => _query = v),
          textInputAction: TextInputAction.search,
        ),
      ),
      body: _query.trim().isEmpty
          ? const Center(
              child: Text('输入关键词开始搜索', style: TextStyle(color: Colors.grey)),
            )
          : _SearchResults(query: _query),
    );
  }
}

class _SearchResults extends ConsumerWidget {
  const _SearchResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(searchQueryProvider(query));

    return resultAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(e.toString())),
      data: (result) {
        final clientAsync = ref.watch(navidromeClientProvider);
        final client = clientAsync.valueOrNull;

        if (result.artist.isEmpty && result.album.isEmpty && result.song.isEmpty) {
          return const Center(child: Text('没有找到相关内容'));
        }

        return ListView(
          children: [
            // ── Artists ──────────────────────────────────────────────────
            if (result.artist.isNotEmpty) ...[
              _SectionHeader(title: '歌手', count: result.artist.length),
              ...result.artist.map((artist) {
                final coverUrl = artist.coverArt != null
                    ? client?.coverArtUrl(artist.coverArt!, size: 100)
                    : null;
                return ListTile(
                  leading: CoverArtImage(url: coverUrl, size: 48),
                  title: Text(artist.name),
                  subtitle: artist.albumCount != null
                      ? Text('${artist.albumCount} 张专辑')
                      : null,
                  onTap: () => context.go('/artists/${artist.id}'),
                );
              }),
            ],

            // ── Albums ───────────────────────────────────────────────────
            if (result.album.isNotEmpty) ...[
              _SectionHeader(title: '专辑', count: result.album.length),
              ...result.album.map((album) {
                final coverUrl = album.coverArt != null
                    ? client?.coverArtUrl(album.coverArt!, size: 100)
                    : null;
                return ListTile(
                  leading: CoverArtImage(url: coverUrl, size: 48),
                  title: Text(album.name),
                  subtitle: Text(album.artist ?? ''),
                  onTap: () => context.go('/albums/${album.id}'),
                );
              }),
            ],

            // ── Songs ────────────────────────────────────────────────────
            if (result.song.isNotEmpty) ...[
              _SectionHeader(title: '歌曲', count: result.song.length),
              ...List.generate(result.song.length, (index) {
                final song = result.song[index];
                final coverUrl = song.coverArt != null
                    ? client?.coverArtUrl(song.coverArt!, size: 100)
                    : null;
                return SongListTile(
                  song: song,
                  coverArtUrl: coverUrl,
                  onTap: () {
                    ref
                        .read(playerControllerProvider.notifier)
                        .playSongs(result.song, startIndex: index)
                        .then((_) {
                      if (context.mounted) context.push('/player');
                    });
                  },
                );
              }),
            ],
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.count});
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 8),
          Text(
            '$count',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
