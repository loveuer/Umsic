import 'package:freezed_annotation/freezed_annotation.dart';

part 'subsonic_models.freezed.dart';
part 'subsonic_models.g.dart';

// Navidrome returns `starred` as an ISO-8601 date string when starred,
// and omits the key (null) when not starred.
class _StarredConverter implements JsonConverter<bool, Object?> {
  const _StarredConverter();

  @override
  bool fromJson(Object? json) => json != null && json != false;

  @override
  Object? toJson(bool object) => object ? true : null;
}

// ─── Song ────────────────────────────────────────────────────────────────────

@freezed
class Song with _$Song {
  const factory Song({
    required String id,
    required String title,
    String? artist,
    String? artistId,
    String? album,
    String? albumId,
    String? coverArt,
    int? duration,
    int? track,
    int? year,
    String? genre,
    String? contentType,
    String? suffix,
    int? size,
    int? bitRate,
    @Default(false) @_StarredConverter() bool starred,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}

// ─── Artist ───────────────────────────────────────────────────────────────────

@freezed
class Artist with _$Artist {
  const factory Artist({
    required String id,
    required String name,
    String? coverArt,
    int? albumCount,
    @Default(false) @_StarredConverter() bool starred,
  }) = _Artist;

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);
}

@freezed
class ArtistDetail with _$ArtistDetail {
  const factory ArtistDetail({
    required String id,
    required String name,
    String? coverArt,
    @Default([]) List<Album> album,
    @Default(false) @_StarredConverter() bool starred,
  }) = _ArtistDetail;

  factory ArtistDetail.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailFromJson(json);
}

// ─── Album ────────────────────────────────────────────────────────────────────

@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? duration,
    int? year,
    String? genre,
    @Default(false) @_StarredConverter() bool starred,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}

@freezed
class AlbumDetail with _$AlbumDetail {
  const factory AlbumDetail({
    required String id,
    required String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? year,
    String? genre,
    @Default([]) List<Song> song,
    @Default(false) @_StarredConverter() bool starred,
  }) = _AlbumDetail;

  factory AlbumDetail.fromJson(Map<String, dynamic> json) =>
      _$AlbumDetailFromJson(json);
}

// ─── Playlist ─────────────────────────────────────────────────────────────────

@freezed
class Playlist with _$Playlist {
  const factory Playlist({
    required String id,
    required String name,
    String? comment,
    int? songCount,
    int? duration,
    String? coverArt,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}

@freezed
class PlaylistDetail with _$PlaylistDetail {
  const factory PlaylistDetail({
    required String id,
    required String name,
    String? comment,
    int? songCount,
    String? coverArt,
    @Default([]) List<Song> entries,
  }) = _PlaylistDetail;

  factory PlaylistDetail.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailFromJson(json);
}

// ─── Starred ──────────────────────────────────────────────────────────────────

@freezed
class Starred2Result with _$Starred2Result {
  const factory Starred2Result({
    @Default([]) List<Song> song,
    @Default([]) List<Album> album,
    @Default([]) List<Artist> artist,
  }) = _Starred2Result;

  factory Starred2Result.fromJson(Map<String, dynamic> json) =>
      _$Starred2ResultFromJson(json);
}

// ─── Search ───────────────────────────────────────────────────────────────────

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default([]) List<Artist> artist,
    @Default([]) List<Album> album,
    @Default([]) List<Song> song,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
