import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/api/models/subsonic_models.dart';
import '../../core/api/navidrome_client.dart';

part 'albums_provider.g.dart';

@riverpod
Future<List<Album>> albums(AlbumsRef ref) async {
  final client = await ref.watch(navidromeClientProvider.future);
  return client.getAlbums();
}

@riverpod
Future<AlbumDetail> albumDetail(AlbumDetailRef ref, String id) async {
  final client = await ref.watch(navidromeClientProvider.future);
  return client.getAlbum(id);
}
