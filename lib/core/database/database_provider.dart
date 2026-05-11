import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_database.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  throw UnimplementedError('appDatabase must be overridden in main via ProviderScope overrides');
}

/// Look up a cached song's local cover art path by ID. Returns null if not cached.
@riverpod
Future<String?> cachedCoverArtPath(CachedCoverArtPathRef ref, String songId) async {
  final db = ref.watch(appDatabaseProvider);
  final cached = await db.getById(songId);
  return cached?.coverArtPath;
}

/// Look up cached lyrics JSON by song ID. Returns null if not cached.
@riverpod
Future<String?> cachedLyricsJson(CachedLyricsJsonRef ref, String songId) async {
  final db = ref.watch(appDatabaseProvider);
  final cached = await db.getById(songId);
  return cached?.lyricsJson;
}
