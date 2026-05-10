import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'core/audio/audio_handler.dart';
import 'core/audio/player_controller.dart';
import 'core/database/app_database.dart';
import 'core/database/database_provider.dart';
import 'core/storage/cache_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final maxSizeMb = prefs.getInt(kCacheMaxSizeMbKey) ?? kDefaultCacheMaxSizeMb;
  final imageMgr = MusicImageCacheManager(
    maxObjects: imageObjectsFromMb(maxSizeMb),
  );

  final db = AppDatabase();

  final handler = await AudioService.init(
    builder: () => MusicAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.umsic.audio',
      androidNotificationChannelName: 'Umsic Playback',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
  handler.setDatabase(db);

  runApp(
    ProviderScope(
      overrides: [
        audioHandlerProvider.overrideWithValue(handler),
        imageCacheManagerProvider.overrideWithValue(imageMgr),
        appDatabaseProvider.overrideWithValue(db),
      ],
      child: const MusicApp(),
    ),
  );
}

class MusicApp extends ConsumerWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Umsic',
      theme: buildTheme(dark: false),
      darkTheme: buildTheme(dark: true),
      routerConfig: router,
    );
  }
}
