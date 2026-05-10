import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/albums/albums_screen.dart';
import '../features/artists/artists_screen.dart';
import '../features/downloads/downloads_screen.dart';
import '../features/player/player_screen.dart';
import '../features/playlists/playlists_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/search/search_screen.dart';
import '../features/songs/songs_screen.dart';
import 'main_shell.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/songs',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/songs', builder: (context, state) => const SongsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/artists',
              builder: (context, state) => const ArtistsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) =>
                      ArtistDetailScreen(artistId: state.pathParameters['id']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/albums',
              builder: (context, state) => const AlbumsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) =>
                      AlbumDetailScreen(albumId: state.pathParameters['id']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/playlists',
              builder: (context, state) => const PlaylistsScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) =>
                      PlaylistDetailScreen(playlistId: state.pathParameters['id']!),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/downloads',
              builder: (context, state) => const DownloadsScreen(),
            ),
          ]),
        ],
      ),
      GoRoute(path: '/player', builder: (context, state) => const PlayerScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
    ],
  );
}
