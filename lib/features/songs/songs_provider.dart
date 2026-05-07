import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';

part 'songs_provider.g.dart';

@riverpod
Future<List<Song>> songs(SongsRef ref) async {
  final client = await ref.watch(navidromeClientProvider.future);
  return client.getSongs();
}
