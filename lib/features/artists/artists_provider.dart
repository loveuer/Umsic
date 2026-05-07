import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';

part 'artists_provider.g.dart';

@riverpod
Future<List<Artist>> artists(ArtistsRef ref) async {
  final client = await ref.watch(navidromeClientProvider.future);
  return client.getArtists();
}

@riverpod
Future<ArtistDetail> artistDetail(ArtistDetailRef ref, String id) async {
  final client = await ref.watch(navidromeClientProvider.future);
  return client.getArtist(id);
}
