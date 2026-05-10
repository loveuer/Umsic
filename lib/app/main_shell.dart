import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shared/widgets/mini_player.dart';

class MainShell extends ConsumerWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _tabs = [
    (label: '歌曲', icon: Icons.music_note_outlined, activeIcon: Icons.music_note),
    (label: '歌手', icon: Icons.person_outlined, activeIcon: Icons.person),
    (label: '专辑', icon: Icons.album_outlined, activeIcon: Icons.album),
    (label: '歌单', icon: Icons.queue_music_outlined, activeIcon: Icons.queue_music),
    (label: '已下载', icon: Icons.download_outlined, activeIcon: Icons.download),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabs[navigationShell.currentIndex].label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            tooltip: '搜索',
            onPressed: () => context.push('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: '设置',
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: navigationShell),
          const MiniPlayer(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: _tabs
            .map((t) => NavigationDestination(
                  label: t.label,
                  icon: Icon(t.icon),
                  selectedIcon: Icon(t.activeIcon),
                ))
            .toList(),
      ),
    );
  }
}
