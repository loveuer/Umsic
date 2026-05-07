// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsonic_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongImpl _$$SongImplFromJson(Map<String, dynamic> json) => _$SongImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  artist: json['artist'] as String?,
  artistId: json['artistId'] as String?,
  album: json['album'] as String?,
  albumId: json['albumId'] as String?,
  coverArt: json['coverArt'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  track: (json['track'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  genre: json['genre'] as String?,
  contentType: json['contentType'] as String?,
  suffix: json['suffix'] as String?,
  size: (json['size'] as num?)?.toInt(),
  bitRate: (json['bitRate'] as num?)?.toInt(),
  starred: json['starred'] == null
      ? false
      : const _StarredConverter().fromJson(json['starred']),
);

Map<String, dynamic> _$$SongImplToJson(_$SongImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'album': instance.album,
      'albumId': instance.albumId,
      'coverArt': instance.coverArt,
      'duration': instance.duration,
      'track': instance.track,
      'year': instance.year,
      'genre': instance.genre,
      'contentType': instance.contentType,
      'suffix': instance.suffix,
      'size': instance.size,
      'bitRate': instance.bitRate,
      'starred': const _StarredConverter().toJson(instance.starred),
    };

_$ArtistImpl _$$ArtistImplFromJson(Map<String, dynamic> json) => _$ArtistImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  coverArt: json['coverArt'] as String?,
  albumCount: (json['albumCount'] as num?)?.toInt(),
  starred: json['starred'] == null
      ? false
      : const _StarredConverter().fromJson(json['starred']),
);

Map<String, dynamic> _$$ArtistImplToJson(_$ArtistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverArt': instance.coverArt,
      'albumCount': instance.albumCount,
      'starred': const _StarredConverter().toJson(instance.starred),
    };

_$ArtistDetailImpl _$$ArtistDetailImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      coverArt: json['coverArt'] as String?,
      album:
          (json['album'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      starred: json['starred'] == null
          ? false
          : const _StarredConverter().fromJson(json['starred']),
    );

Map<String, dynamic> _$$ArtistDetailImplToJson(_$ArtistDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverArt': instance.coverArt,
      'album': instance.album,
      'starred': const _StarredConverter().toJson(instance.starred),
    };

_$AlbumImpl _$$AlbumImplFromJson(Map<String, dynamic> json) => _$AlbumImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  artist: json['artist'] as String?,
  artistId: json['artistId'] as String?,
  coverArt: json['coverArt'] as String?,
  songCount: (json['songCount'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  year: (json['year'] as num?)?.toInt(),
  genre: json['genre'] as String?,
  starred: json['starred'] == null
      ? false
      : const _StarredConverter().fromJson(json['starred']),
);

Map<String, dynamic> _$$AlbumImplToJson(_$AlbumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'coverArt': instance.coverArt,
      'songCount': instance.songCount,
      'duration': instance.duration,
      'year': instance.year,
      'genre': instance.genre,
      'starred': const _StarredConverter().toJson(instance.starred),
    };

_$AlbumDetailImpl _$$AlbumDetailImplFromJson(Map<String, dynamic> json) =>
    _$AlbumDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      artist: json['artist'] as String?,
      artistId: json['artistId'] as String?,
      coverArt: json['coverArt'] as String?,
      songCount: (json['songCount'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
      genre: json['genre'] as String?,
      song:
          (json['song'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      starred: json['starred'] == null
          ? false
          : const _StarredConverter().fromJson(json['starred']),
    );

Map<String, dynamic> _$$AlbumDetailImplToJson(_$AlbumDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'coverArt': instance.coverArt,
      'songCount': instance.songCount,
      'year': instance.year,
      'genre': instance.genre,
      'song': instance.song,
      'starred': const _StarredConverter().toJson(instance.starred),
    };

_$PlaylistImpl _$$PlaylistImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      comment: json['comment'] as String?,
      songCount: (json['songCount'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      coverArt: json['coverArt'] as String?,
    );

Map<String, dynamic> _$$PlaylistImplToJson(_$PlaylistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'comment': instance.comment,
      'songCount': instance.songCount,
      'duration': instance.duration,
      'coverArt': instance.coverArt,
    };

_$PlaylistDetailImpl _$$PlaylistDetailImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistDetailImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      comment: json['comment'] as String?,
      songCount: (json['songCount'] as num?)?.toInt(),
      coverArt: json['coverArt'] as String?,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlaylistDetailImplToJson(
  _$PlaylistDetailImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'comment': instance.comment,
  'songCount': instance.songCount,
  'coverArt': instance.coverArt,
  'entries': instance.entries,
};

_$Starred2ResultImpl _$$Starred2ResultImplFromJson(Map<String, dynamic> json) =>
    _$Starred2ResultImpl(
      song:
          (json['song'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      album:
          (json['album'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      artist:
          (json['artist'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$Starred2ResultImplToJson(
  _$Starred2ResultImpl instance,
) => <String, dynamic>{
  'song': instance.song,
  'album': instance.album,
  'artist': instance.artist,
};

_$SearchResultImpl _$$SearchResultImplFromJson(Map<String, dynamic> json) =>
    _$SearchResultImpl(
      artist:
          (json['artist'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      album:
          (json['album'] as List<dynamic>?)
              ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      song:
          (json['song'] as List<dynamic>?)
              ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SearchResultImplToJson(_$SearchResultImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'album': instance.album,
      'song': instance.song,
    };
