import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../storage/settings_storage.dart';
import 'models/subsonic_models.dart';

part 'navidrome_client.g.dart';

class SubsonicException implements Exception {
  SubsonicException(this.code, this.message);
  final int code;
  final String message;

  @override
  String toString() => 'SubsonicException($code): $message';
}

class NotConfiguredException implements Exception {
  @override
  String toString() => 'Server not configured. Please set up credentials in Settings.';
}

class NavidromeClient {
  NavidromeClient({
    required this.serverUrl,
    required this.username,
    required this.password,
  }) : _dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 30),
        ));

  final String serverUrl;
  final String username;
  final String password;
  final Dio _dio;

  // ─── Auth ──────────────────────────────────────────────────────────────────

  static String _generateSalt([int length = 12]) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rng = Random.secure();
    return List.generate(length, (_) => chars[rng.nextInt(chars.length)]).join();
  }

  Map<String, String> _authParams() {
    final salt = _generateSalt();
    final token = md5.convert(utf8.encode('$password$salt')).toString();
    return {
      'u': username,
      't': token,
      's': salt,
      'v': '1.16.1',
      'c': 'Umsic',
      'f': 'json',
    };
  }

  /// Build a URL suitable for direct use (e.g., stream, cover art)
  String buildUrl(String endpoint, Map<String, String> extra) {
    final params = {..._authParams(), ...extra};
    final query = params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&');
    return '$serverUrl/rest/$endpoint?$query';
  }

  // ─── Core request ─────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> _request(
    String endpoint, [
    Map<String, String> params = const {},
  ]) async {
    final queryParams = {..._authParams(), ...params};
    final response = await _dio.get<Map<String, dynamic>>(
      '$serverUrl/rest/$endpoint',
      queryParameters: queryParams,
    );
    final body = response.data!['subsonic-response'] as Map<String, dynamic>;
    if (body['status'] != 'ok') {
      final error = body['error'] as Map<String, dynamic>?;
      throw SubsonicException(
        error?['code'] as int? ?? -1,
        error?['message'] as String? ?? 'Unknown error',
      );
    }
    return body;
  }

  // ─── Ping ─────────────────────────────────────────────────────────────────

  Future<void> ping() => _request('ping');

  // ─── Songs ────────────────────────────────────────────────────────────────

  Future<List<Song>> getSongs({int size = 500, int offset = 0}) async {
    final body = await _request('search3', {
      'query': '',
      'songCount': '$size',
      'songOffset': '$offset',
      'albumCount': '0',
      'artistCount': '0',
    });
    final result = body['searchResult3'] as Map<String, dynamic>? ?? {};
    final songs = result['song'] as List<dynamic>? ?? [];
    return songs.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Song> getSong(String id) async {
    final body = await _request('getSong', {'id': id});
    return Song.fromJson(body['song'] as Map<String, dynamic>);
  }

  // ─── Artists ──────────────────────────────────────────────────────────────

  Future<List<Artist>> getArtists() async {
    final body = await _request('getArtists');
    final artists = body['artists'] as Map<String, dynamic>;
    final indices = artists['index'] as List<dynamic>? ?? [];
    return indices
        .expand((idx) => (idx as Map<String, dynamic>)['artist'] as List<dynamic>? ?? [])
        .map((e) => Artist.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ArtistDetail> getArtist(String id) async {
    final body = await _request('getArtist', {'id': id});
    return ArtistDetail.fromJson(body['artist'] as Map<String, dynamic>);
  }

  // ─── Albums ───────────────────────────────────────────────────────────────

  Future<List<Album>> getAlbums({
    String type = 'alphabeticalByName',
    int size = 500,
    int offset = 0,
  }) async {
    final body = await _request('getAlbumList2', {
      'type': type,
      'size': '$size',
      'offset': '$offset',
    });
    final list = body['albumList2'] as Map<String, dynamic>?;
    final albums = list?['album'] as List<dynamic>? ?? [];
    return albums.map((e) => Album.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<AlbumDetail> getAlbum(String id) async {
    final body = await _request('getAlbum', {'id': id});
    return AlbumDetail.fromJson(body['album'] as Map<String, dynamic>);
  }

  // ─── Playlists ────────────────────────────────────────────────────────────

  Future<List<Playlist>> getPlaylists() async {
    final body = await _request('getPlaylists');
    final pl = body['playlists'] as Map<String, dynamic>?;
    final list = pl?['playlist'] as List<dynamic>? ?? [];
    return list.map((e) => Playlist.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<PlaylistDetail> getPlaylist(String id) async {
    final body = await _request('getPlaylist', {'id': id});
    final raw = Map<String, dynamic>.from(body['playlist'] as Map<String, dynamic>);
    // Navidrome returns songs under key 'entry', map to 'entries'
    if (raw.containsKey('entry')) raw['entries'] = raw.remove('entry');
    return PlaylistDetail.fromJson(raw);
  }

  // ─── Starred (我的最爱) ────────────────────────────────────────────────────

  Future<Starred2Result> getStarred2() async {
    final body = await _request('getStarred2');
    return Starred2Result.fromJson(body['starred2'] as Map<String, dynamic>);
  }

  Future<void> star(String id) => _request('star', {'id': id});
  Future<void> unstar(String id) => _request('unstar', {'id': id});

  // ─── Lyrics ────────────────────────────────────────────────────────────────

  Future<List<StructuredLyrics>> getLyrics(String songId) async {
    try {
      final body = await _request('getLyricsBySongId', {'id': songId});
      final lyricsList = body['lyricsList'] as Map<String, dynamic>?;
      if (lyricsList == null) return [];
      final lyrics = lyricsList['structuredLyrics'] as List<dynamic>? ?? [];
      return lyrics.map((e) => StructuredLyrics.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  // ─── Search ───────────────────────────────────────────────────────────────

  Future<SearchResult> search(String query) async {
    final body = await _request('search3', {
      'query': query,
      'artistCount': '10',
      'albumCount': '10',
      'songCount': '20',
    });
    return SearchResult.fromJson(body['searchResult3'] as Map<String, dynamic>);
  }

  // ─── URLs for media ───────────────────────────────────────────────────────

  String streamUrl(String id, {int? maxBitRate}) => buildUrl('stream', {
        'id': id,
        if (maxBitRate != null) 'maxBitRate': '$maxBitRate',
      });

  String coverArtUrl(String id, {int size = 300}) =>
      buildUrl('getCoverArt', {'id': id, 'size': '$size'});
}

// ─── Provider ──────────────────────────────────────────────────────────────────

@riverpod
Future<NavidromeClient> navidromeClient(NavidromeClientRef ref) async {
  final storage = ref.watch(settingsStorageProvider);
  final creds = await storage.getCredentials();
  if (creds == null) throw NotConfiguredException();
  return NavidromeClient(
    serverUrl: creds.serverUrl,
    username: creds.username,
    password: creds.password,
  );
}
