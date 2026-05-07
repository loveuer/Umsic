import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cache_manager.g.dart';

const String kCacheMaxSizeMbKey = 'cache_max_size_mb';
const int kDefaultCacheMaxSizeMb = 5 * 1024; // 5 GB

// ─── Cache Managers ───────────────────────────────────────────────────────────

class MusicAudioCacheManager extends CacheManager {
  static const String cacheKey = 'music_audio_cache';

  MusicAudioCacheManager({required int maxObjects})
      : super(Config(
          cacheKey,
          maxNrOfCacheObjects: maxObjects,
          stalePeriod: const Duration(days: 30),
        ));
}

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

/// Convert MB budget to a max object count for audio (~7 MB/file average).
int audioObjectsFromMb(int maxSizeMb) =>
    (maxSizeMb * 1024 ~/ 7168).clamp(10, 5000);

/// Convert MB budget to a max object count for images (~100 KB/file average).
int imageObjectsFromMb(int maxSizeMb) =>
    (maxSizeMb * 2).clamp(100, 10000);

// ─── Providers ────────────────────────────────────────────────────────────────

/// Override in main() with an initialized MusicAudioCacheManager.
@Riverpod(keepAlive: true)
MusicAudioCacheManager audioCacheManager(AudioCacheManagerRef ref) {
  throw UnimplementedError('audioCacheManager must be overridden in main()');
}

/// Override in main() with an initialized MusicImageCacheManager.
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
  // Scan the whole temp directory — covers DefaultCacheManager (audio),
  // MusicImageCacheManager, and any other cache.
  final tempDir = await getTemporaryDirectory();
  int total = 0;
  final dir = Directory(tempDir.path);
  if (!await dir.exists()) return 0;
  await for (final entity in dir.list(recursive: true)) {
    if (entity is File) {
      try {
        total += await entity.length();
      } catch (_) {}
    }
  }
  return total;
}
