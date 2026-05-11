import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/app_database.dart';
import '../database/database_provider.dart';

part 'cache_manager.g.dart';

const String kCacheMaxSizeMbKey = 'cache_max_size_mb';
const int kDefaultCacheMaxSizeMb = 5 * 1024; // 5 GB

// ─── Cache Managers ───────────────────────────────────────────────────────────

class MusicImageCacheManager extends CacheManager with ImageCacheManager {
  static const String cacheKey = 'music_image_cache';

  MusicImageCacheManager({required int maxObjects})
      : super(Config(
          cacheKey,
          maxNrOfCacheObjects: maxObjects,
          stalePeriod: const Duration(days: 30),
        ));
}

// ─── Conversion helpers ───────────────────────────────────────────────────────

int imageObjectsFromMb(int maxSizeMb) => (maxSizeMb * 2).clamp(100, 10000);

// ─── Providers ────────────────────────────────────────────────────────────────

@Riverpod(keepAlive: true)
MusicImageCacheManager imageCacheManager(ImageCacheManagerRef ref) {
  throw UnimplementedError('imageCacheManager must be overridden in main()');
}

// ─── Cache size setting ───────────────────────────────────────────────────────

@riverpod
class CacheMaxSizeMb extends _$CacheMaxSizeMb {
  @override
  Future<int> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(kCacheMaxSizeMbKey) ?? kDefaultCacheMaxSizeMb;
  }

  Future<void> setSizeMb(int mb) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(kCacheMaxSizeMbKey, mb);
    state = AsyncData(mb);
  }
}

// ─── Cache usage ──────────────────────────────────────────────────────────────

@riverpod
Future<int> cacheUsageBytes(CacheUsageBytesRef ref) async {
  final db = ref.watch(appDatabaseProvider);
  final audioBytes = await db.totalCacheSize();

  // Also count image cache
  final tempDir = await getTemporaryDirectory();
  final imageDir = Directory('${tempDir.path}/${MusicImageCacheManager.cacheKey}');
  int imageBytes = 0;
  if (await imageDir.exists()) {
    await for (final entity in imageDir.list(recursive: true)) {
      if (entity is File) {
        try {
          imageBytes += await entity.length();
        } catch (_) {}
      }
    }
  }

  return audioBytes + imageBytes;
}

// ─── Cache eviction ───────────────────────────────────────────────────────────

Future<void> evictCacheIfNeeded(AppDatabase db, int maxBytes) async {
  final currentBytes = await db.totalCacheSize();
  if (currentBytes <= maxBytes) return;

  // Delete oldest entries until we're under the limit
  // Remove 10% extra to avoid evicting on every new cache
  final targetBytes = (maxBytes * 0.9).round();
  var freed = 0;

  while (currentBytes - freed > targetBytes) {
    final oldest = await db.oldestForEviction(1);
    if (oldest.isEmpty) break;
    final entry = oldest.first;
    final file = File(entry.filePath);
    if (await file.exists()) {
      freed += await file.length();
      await file.delete();
    }
    // Also delete cached cover art file
    final coverPath = entry.coverArtPath;
    if (coverPath != null && coverPath.isNotEmpty) {
      final coverFile = File(coverPath);
      if (await coverFile.exists()) {
        await coverFile.delete();
      }
    }
    await db.deleteById(entry.id);
  }
}
