// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subsonic_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get artistId => throw _privateConstructorUsedError;
  String? get album => throw _privateConstructorUsedError;
  String? get albumId => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get track => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get bitRate => throw _privateConstructorUsedError;
  @_StarredConverter()
  bool get starred => throw _privateConstructorUsedError;

  /// Serializes this Song to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res, Song>;
  @useResult
  $Res call({
    String id,
    String title,
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
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class _$SongCopyWithImpl<$Res, $Val extends Song>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? album = freezed,
    Object? albumId = freezed,
    Object? coverArt = freezed,
    Object? duration = freezed,
    Object? track = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? contentType = freezed,
    Object? suffix = freezed,
    Object? size = freezed,
    Object? bitRate = freezed,
    Object? starred = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            artist: freezed == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as String?,
            artistId: freezed == artistId
                ? _value.artistId
                : artistId // ignore: cast_nullable_to_non_nullable
                      as String?,
            album: freezed == album
                ? _value.album
                : album // ignore: cast_nullable_to_non_nullable
                      as String?,
            albumId: freezed == albumId
                ? _value.albumId
                : albumId // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            track: freezed == track
                ? _value.track
                : track // ignore: cast_nullable_to_non_nullable
                      as int?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int?,
            genre: freezed == genre
                ? _value.genre
                : genre // ignore: cast_nullable_to_non_nullable
                      as String?,
            contentType: freezed == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String?,
            suffix: freezed == suffix
                ? _value.suffix
                : suffix // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
            bitRate: freezed == bitRate
                ? _value.bitRate
                : bitRate // ignore: cast_nullable_to_non_nullable
                      as int?,
            starred: null == starred
                ? _value.starred
                : starred // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SongImplCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$SongImplCopyWith(
    _$SongImpl value,
    $Res Function(_$SongImpl) then,
  ) = __$$SongImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
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
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class __$$SongImplCopyWithImpl<$Res>
    extends _$SongCopyWithImpl<$Res, _$SongImpl>
    implements _$$SongImplCopyWith<$Res> {
  __$$SongImplCopyWithImpl(_$SongImpl _value, $Res Function(_$SongImpl) _then)
    : super(_value, _then);

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? album = freezed,
    Object? albumId = freezed,
    Object? coverArt = freezed,
    Object? duration = freezed,
    Object? track = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? contentType = freezed,
    Object? suffix = freezed,
    Object? size = freezed,
    Object? bitRate = freezed,
    Object? starred = null,
  }) {
    return _then(
      _$SongImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        artist: freezed == artist
            ? _value.artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as String?,
        artistId: freezed == artistId
            ? _value.artistId
            : artistId // ignore: cast_nullable_to_non_nullable
                  as String?,
        album: freezed == album
            ? _value.album
            : album // ignore: cast_nullable_to_non_nullable
                  as String?,
        albumId: freezed == albumId
            ? _value.albumId
            : albumId // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        track: freezed == track
            ? _value.track
            : track // ignore: cast_nullable_to_non_nullable
                  as int?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int?,
        genre: freezed == genre
            ? _value.genre
            : genre // ignore: cast_nullable_to_non_nullable
                  as String?,
        contentType: freezed == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String?,
        suffix: freezed == suffix
            ? _value.suffix
            : suffix // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
        bitRate: freezed == bitRate
            ? _value.bitRate
            : bitRate // ignore: cast_nullable_to_non_nullable
                  as int?,
        starred: null == starred
            ? _value.starred
            : starred // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SongImpl implements _Song {
  const _$SongImpl({
    required this.id,
    required this.title,
    this.artist,
    this.artistId,
    this.album,
    this.albumId,
    this.coverArt,
    this.duration,
    this.track,
    this.year,
    this.genre,
    this.contentType,
    this.suffix,
    this.size,
    this.bitRate,
    @_StarredConverter() this.starred = false,
  });

  factory _$SongImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? artist;
  @override
  final String? artistId;
  @override
  final String? album;
  @override
  final String? albumId;
  @override
  final String? coverArt;
  @override
  final int? duration;
  @override
  final int? track;
  @override
  final int? year;
  @override
  final String? genre;
  @override
  final String? contentType;
  @override
  final String? suffix;
  @override
  final int? size;
  @override
  final int? bitRate;
  @override
  @JsonKey()
  @_StarredConverter()
  final bool starred;

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artist: $artist, artistId: $artistId, album: $album, albumId: $albumId, coverArt: $coverArt, duration: $duration, track: $track, year: $year, genre: $genre, contentType: $contentType, suffix: $suffix, size: $size, bitRate: $bitRate, starred: $starred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.track, track) || other.track == track) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    artist,
    artistId,
    album,
    albumId,
    coverArt,
    duration,
    track,
    year,
    genre,
    contentType,
    suffix,
    size,
    bitRate,
    starred,
  );

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      __$$SongImplCopyWithImpl<_$SongImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongImplToJson(this);
  }
}

abstract class _Song implements Song {
  const factory _Song({
    required final String id,
    required final String title,
    final String? artist,
    final String? artistId,
    final String? album,
    final String? albumId,
    final String? coverArt,
    final int? duration,
    final int? track,
    final int? year,
    final String? genre,
    final String? contentType,
    final String? suffix,
    final int? size,
    final int? bitRate,
    @_StarredConverter() final bool starred,
  }) = _$SongImpl;

  factory _Song.fromJson(Map<String, dynamic> json) = _$SongImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get artist;
  @override
  String? get artistId;
  @override
  String? get album;
  @override
  String? get albumId;
  @override
  String? get coverArt;
  @override
  int? get duration;
  @override
  int? get track;
  @override
  int? get year;
  @override
  String? get genre;
  @override
  String? get contentType;
  @override
  String? get suffix;
  @override
  int? get size;
  @override
  int? get bitRate;
  @override
  @_StarredConverter()
  bool get starred;

  /// Create a copy of Song
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SongImplCopyWith<_$SongImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return _Artist.fromJson(json);
}

/// @nodoc
mixin _$Artist {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  int? get albumCount => throw _privateConstructorUsedError;
  @_StarredConverter()
  bool get starred => throw _privateConstructorUsedError;

  /// Serializes this Artist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistCopyWith<Artist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistCopyWith<$Res> {
  factory $ArtistCopyWith(Artist value, $Res Function(Artist) then) =
      _$ArtistCopyWithImpl<$Res, Artist>;
  @useResult
  $Res call({
    String id,
    String name,
    String? coverArt,
    int? albumCount,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class _$ArtistCopyWithImpl<$Res, $Val extends Artist>
    implements $ArtistCopyWith<$Res> {
  _$ArtistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverArt = freezed,
    Object? albumCount = freezed,
    Object? starred = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            albumCount: freezed == albumCount
                ? _value.albumCount
                : albumCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            starred: null == starred
                ? _value.starred
                : starred // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ArtistImplCopyWith<$Res> implements $ArtistCopyWith<$Res> {
  factory _$$ArtistImplCopyWith(
    _$ArtistImpl value,
    $Res Function(_$ArtistImpl) then,
  ) = __$$ArtistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? coverArt,
    int? albumCount,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class __$$ArtistImplCopyWithImpl<$Res>
    extends _$ArtistCopyWithImpl<$Res, _$ArtistImpl>
    implements _$$ArtistImplCopyWith<$Res> {
  __$$ArtistImplCopyWithImpl(
    _$ArtistImpl _value,
    $Res Function(_$ArtistImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverArt = freezed,
    Object? albumCount = freezed,
    Object? starred = null,
  }) {
    return _then(
      _$ArtistImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        albumCount: freezed == albumCount
            ? _value.albumCount
            : albumCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        starred: null == starred
            ? _value.starred
            : starred // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistImpl implements _Artist {
  const _$ArtistImpl({
    required this.id,
    required this.name,
    this.coverArt,
    this.albumCount,
    @_StarredConverter() this.starred = false,
  });

  factory _$ArtistImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? coverArt;
  @override
  final int? albumCount;
  @override
  @JsonKey()
  @_StarredConverter()
  final bool starred;

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, coverArt: $coverArt, albumCount: $albumCount, starred: $starred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            (identical(other.albumCount, albumCount) ||
                other.albumCount == albumCount) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, coverArt, albumCount, starred);

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      __$$ArtistImplCopyWithImpl<_$ArtistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistImplToJson(this);
  }
}

abstract class _Artist implements Artist {
  const factory _Artist({
    required final String id,
    required final String name,
    final String? coverArt,
    final int? albumCount,
    @_StarredConverter() final bool starred,
  }) = _$ArtistImpl;

  factory _Artist.fromJson(Map<String, dynamic> json) = _$ArtistImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get coverArt;
  @override
  int? get albumCount;
  @override
  @_StarredConverter()
  bool get starred;

  /// Create a copy of Artist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistImplCopyWith<_$ArtistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ArtistDetail _$ArtistDetailFromJson(Map<String, dynamic> json) {
  return _ArtistDetail.fromJson(json);
}

/// @nodoc
mixin _$ArtistDetail {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  List<Album> get album => throw _privateConstructorUsedError;
  @_StarredConverter()
  bool get starred => throw _privateConstructorUsedError;

  /// Serializes this ArtistDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtistDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistDetailCopyWith<ArtistDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistDetailCopyWith<$Res> {
  factory $ArtistDetailCopyWith(
    ArtistDetail value,
    $Res Function(ArtistDetail) then,
  ) = _$ArtistDetailCopyWithImpl<$Res, ArtistDetail>;
  @useResult
  $Res call({
    String id,
    String name,
    String? coverArt,
    List<Album> album,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class _$ArtistDetailCopyWithImpl<$Res, $Val extends ArtistDetail>
    implements $ArtistDetailCopyWith<$Res> {
  _$ArtistDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtistDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverArt = freezed,
    Object? album = null,
    Object? starred = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            album: null == album
                ? _value.album
                : album // ignore: cast_nullable_to_non_nullable
                      as List<Album>,
            starred: null == starred
                ? _value.starred
                : starred // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ArtistDetailImplCopyWith<$Res>
    implements $ArtistDetailCopyWith<$Res> {
  factory _$$ArtistDetailImplCopyWith(
    _$ArtistDetailImpl value,
    $Res Function(_$ArtistDetailImpl) then,
  ) = __$$ArtistDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? coverArt,
    List<Album> album,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class __$$ArtistDetailImplCopyWithImpl<$Res>
    extends _$ArtistDetailCopyWithImpl<$Res, _$ArtistDetailImpl>
    implements _$$ArtistDetailImplCopyWith<$Res> {
  __$$ArtistDetailImplCopyWithImpl(
    _$ArtistDetailImpl _value,
    $Res Function(_$ArtistDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ArtistDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coverArt = freezed,
    Object? album = null,
    Object? starred = null,
  }) {
    return _then(
      _$ArtistDetailImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        album: null == album
            ? _value._album
            : album // ignore: cast_nullable_to_non_nullable
                  as List<Album>,
        starred: null == starred
            ? _value.starred
            : starred // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistDetailImpl implements _ArtistDetail {
  const _$ArtistDetailImpl({
    required this.id,
    required this.name,
    this.coverArt,
    final List<Album> album = const [],
    @_StarredConverter() this.starred = false,
  }) : _album = album;

  factory _$ArtistDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? coverArt;
  final List<Album> _album;
  @override
  @JsonKey()
  List<Album> get album {
    if (_album is EqualUnmodifiableListView) return _album;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_album);
  }

  @override
  @JsonKey()
  @_StarredConverter()
  final bool starred;

  @override
  String toString() {
    return 'ArtistDetail(id: $id, name: $name, coverArt: $coverArt, album: $album, starred: $starred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            const DeepCollectionEquality().equals(other._album, _album) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    coverArt,
    const DeepCollectionEquality().hash(_album),
    starred,
  );

  /// Create a copy of ArtistDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistDetailImplCopyWith<_$ArtistDetailImpl> get copyWith =>
      __$$ArtistDetailImplCopyWithImpl<_$ArtistDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistDetailImplToJson(this);
  }
}

abstract class _ArtistDetail implements ArtistDetail {
  const factory _ArtistDetail({
    required final String id,
    required final String name,
    final String? coverArt,
    final List<Album> album,
    @_StarredConverter() final bool starred,
  }) = _$ArtistDetailImpl;

  factory _ArtistDetail.fromJson(Map<String, dynamic> json) =
      _$ArtistDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get coverArt;
  @override
  List<Album> get album;
  @override
  @_StarredConverter()
  bool get starred;

  /// Create a copy of ArtistDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistDetailImplCopyWith<_$ArtistDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return _Album.fromJson(json);
}

/// @nodoc
mixin _$Album {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get artistId => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  int? get songCount => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  @_StarredConverter()
  bool get starred => throw _privateConstructorUsedError;

  /// Serializes this Album to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumCopyWith<Album> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumCopyWith<$Res> {
  factory $AlbumCopyWith(Album value, $Res Function(Album) then) =
      _$AlbumCopyWithImpl<$Res, Album>;
  @useResult
  $Res call({
    String id,
    String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? duration,
    int? year,
    String? genre,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class _$AlbumCopyWithImpl<$Res, $Val extends Album>
    implements $AlbumCopyWith<$Res> {
  _$AlbumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? coverArt = freezed,
    Object? songCount = freezed,
    Object? duration = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? starred = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            artist: freezed == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as String?,
            artistId: freezed == artistId
                ? _value.artistId
                : artistId // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            songCount: freezed == songCount
                ? _value.songCount
                : songCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int?,
            genre: freezed == genre
                ? _value.genre
                : genre // ignore: cast_nullable_to_non_nullable
                      as String?,
            starred: null == starred
                ? _value.starred
                : starred // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlbumImplCopyWith<$Res> implements $AlbumCopyWith<$Res> {
  factory _$$AlbumImplCopyWith(
    _$AlbumImpl value,
    $Res Function(_$AlbumImpl) then,
  ) = __$$AlbumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? duration,
    int? year,
    String? genre,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class __$$AlbumImplCopyWithImpl<$Res>
    extends _$AlbumCopyWithImpl<$Res, _$AlbumImpl>
    implements _$$AlbumImplCopyWith<$Res> {
  __$$AlbumImplCopyWithImpl(
    _$AlbumImpl _value,
    $Res Function(_$AlbumImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? coverArt = freezed,
    Object? songCount = freezed,
    Object? duration = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? starred = null,
  }) {
    return _then(
      _$AlbumImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        artist: freezed == artist
            ? _value.artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as String?,
        artistId: freezed == artistId
            ? _value.artistId
            : artistId // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        songCount: freezed == songCount
            ? _value.songCount
            : songCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int?,
        genre: freezed == genre
            ? _value.genre
            : genre // ignore: cast_nullable_to_non_nullable
                  as String?,
        starred: null == starred
            ? _value.starred
            : starred // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumImpl implements _Album {
  const _$AlbumImpl({
    required this.id,
    required this.name,
    this.artist,
    this.artistId,
    this.coverArt,
    this.songCount,
    this.duration,
    this.year,
    this.genre,
    @_StarredConverter() this.starred = false,
  });

  factory _$AlbumImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? artist;
  @override
  final String? artistId;
  @override
  final String? coverArt;
  @override
  final int? songCount;
  @override
  final int? duration;
  @override
  final int? year;
  @override
  final String? genre;
  @override
  @JsonKey()
  @_StarredConverter()
  final bool starred;

  @override
  String toString() {
    return 'Album(id: $id, name: $name, artist: $artist, artistId: $artistId, coverArt: $coverArt, songCount: $songCount, duration: $duration, year: $year, genre: $genre, starred: $starred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    artist,
    artistId,
    coverArt,
    songCount,
    duration,
    year,
    genre,
    starred,
  );

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      __$$AlbumImplCopyWithImpl<_$AlbumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumImplToJson(this);
  }
}

abstract class _Album implements Album {
  const factory _Album({
    required final String id,
    required final String name,
    final String? artist,
    final String? artistId,
    final String? coverArt,
    final int? songCount,
    final int? duration,
    final int? year,
    final String? genre,
    @_StarredConverter() final bool starred,
  }) = _$AlbumImpl;

  factory _Album.fromJson(Map<String, dynamic> json) = _$AlbumImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get artist;
  @override
  String? get artistId;
  @override
  String? get coverArt;
  @override
  int? get songCount;
  @override
  int? get duration;
  @override
  int? get year;
  @override
  String? get genre;
  @override
  @_StarredConverter()
  bool get starred;

  /// Create a copy of Album
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumImplCopyWith<_$AlbumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AlbumDetail _$AlbumDetailFromJson(Map<String, dynamic> json) {
  return _AlbumDetail.fromJson(json);
}

/// @nodoc
mixin _$AlbumDetail {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  String? get artistId => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  int? get songCount => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  List<Song> get song => throw _privateConstructorUsedError;
  @_StarredConverter()
  bool get starred => throw _privateConstructorUsedError;

  /// Serializes this AlbumDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlbumDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlbumDetailCopyWith<AlbumDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumDetailCopyWith<$Res> {
  factory $AlbumDetailCopyWith(
    AlbumDetail value,
    $Res Function(AlbumDetail) then,
  ) = _$AlbumDetailCopyWithImpl<$Res, AlbumDetail>;
  @useResult
  $Res call({
    String id,
    String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? year,
    String? genre,
    List<Song> song,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class _$AlbumDetailCopyWithImpl<$Res, $Val extends AlbumDetail>
    implements $AlbumDetailCopyWith<$Res> {
  _$AlbumDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlbumDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? coverArt = freezed,
    Object? songCount = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? song = null,
    Object? starred = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            artist: freezed == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as String?,
            artistId: freezed == artistId
                ? _value.artistId
                : artistId // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            songCount: freezed == songCount
                ? _value.songCount
                : songCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int?,
            genre: freezed == genre
                ? _value.genre
                : genre // ignore: cast_nullable_to_non_nullable
                      as String?,
            song: null == song
                ? _value.song
                : song // ignore: cast_nullable_to_non_nullable
                      as List<Song>,
            starred: null == starred
                ? _value.starred
                : starred // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AlbumDetailImplCopyWith<$Res>
    implements $AlbumDetailCopyWith<$Res> {
  factory _$$AlbumDetailImplCopyWith(
    _$AlbumDetailImpl value,
    $Res Function(_$AlbumDetailImpl) then,
  ) = __$$AlbumDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? artist,
    String? artistId,
    String? coverArt,
    int? songCount,
    int? year,
    String? genre,
    List<Song> song,
    @_StarredConverter() bool starred,
  });
}

/// @nodoc
class __$$AlbumDetailImplCopyWithImpl<$Res>
    extends _$AlbumDetailCopyWithImpl<$Res, _$AlbumDetailImpl>
    implements _$$AlbumDetailImplCopyWith<$Res> {
  __$$AlbumDetailImplCopyWithImpl(
    _$AlbumDetailImpl _value,
    $Res Function(_$AlbumDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AlbumDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? artist = freezed,
    Object? artistId = freezed,
    Object? coverArt = freezed,
    Object? songCount = freezed,
    Object? year = freezed,
    Object? genre = freezed,
    Object? song = null,
    Object? starred = null,
  }) {
    return _then(
      _$AlbumDetailImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        artist: freezed == artist
            ? _value.artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as String?,
        artistId: freezed == artistId
            ? _value.artistId
            : artistId // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        songCount: freezed == songCount
            ? _value.songCount
            : songCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int?,
        genre: freezed == genre
            ? _value.genre
            : genre // ignore: cast_nullable_to_non_nullable
                  as String?,
        song: null == song
            ? _value._song
            : song // ignore: cast_nullable_to_non_nullable
                  as List<Song>,
        starred: null == starred
            ? _value.starred
            : starred // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AlbumDetailImpl implements _AlbumDetail {
  const _$AlbumDetailImpl({
    required this.id,
    required this.name,
    this.artist,
    this.artistId,
    this.coverArt,
    this.songCount,
    this.year,
    this.genre,
    final List<Song> song = const [],
    @_StarredConverter() this.starred = false,
  }) : _song = song;

  factory _$AlbumDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlbumDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? artist;
  @override
  final String? artistId;
  @override
  final String? coverArt;
  @override
  final int? songCount;
  @override
  final int? year;
  @override
  final String? genre;
  final List<Song> _song;
  @override
  @JsonKey()
  List<Song> get song {
    if (_song is EqualUnmodifiableListView) return _song;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_song);
  }

  @override
  @JsonKey()
  @_StarredConverter()
  final bool starred;

  @override
  String toString() {
    return 'AlbumDetail(id: $id, name: $name, artist: $artist, artistId: $artistId, coverArt: $coverArt, songCount: $songCount, year: $year, genre: $genre, song: $song, starred: $starred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlbumDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.artistId, artistId) ||
                other.artistId == artistId) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            const DeepCollectionEquality().equals(other._song, _song) &&
            (identical(other.starred, starred) || other.starred == starred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    artist,
    artistId,
    coverArt,
    songCount,
    year,
    genre,
    const DeepCollectionEquality().hash(_song),
    starred,
  );

  /// Create a copy of AlbumDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlbumDetailImplCopyWith<_$AlbumDetailImpl> get copyWith =>
      __$$AlbumDetailImplCopyWithImpl<_$AlbumDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlbumDetailImplToJson(this);
  }
}

abstract class _AlbumDetail implements AlbumDetail {
  const factory _AlbumDetail({
    required final String id,
    required final String name,
    final String? artist,
    final String? artistId,
    final String? coverArt,
    final int? songCount,
    final int? year,
    final String? genre,
    final List<Song> song,
    @_StarredConverter() final bool starred,
  }) = _$AlbumDetailImpl;

  factory _AlbumDetail.fromJson(Map<String, dynamic> json) =
      _$AlbumDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get artist;
  @override
  String? get artistId;
  @override
  String? get coverArt;
  @override
  int? get songCount;
  @override
  int? get year;
  @override
  String? get genre;
  @override
  List<Song> get song;
  @override
  @_StarredConverter()
  bool get starred;

  /// Create a copy of AlbumDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlbumDetailImplCopyWith<_$AlbumDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return _Playlist.fromJson(json);
}

/// @nodoc
mixin _$Playlist {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int? get songCount => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;

  /// Serializes this Playlist to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistCopyWith<Playlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) then) =
      _$PlaylistCopyWithImpl<$Res, Playlist>;
  @useResult
  $Res call({
    String id,
    String name,
    String? comment,
    int? songCount,
    int? duration,
    String? coverArt,
  });
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res, $Val extends Playlist>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? comment = freezed,
    Object? songCount = freezed,
    Object? duration = freezed,
    Object? coverArt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            songCount: freezed == songCount
                ? _value.songCount
                : songCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int?,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaylistImplCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$$PlaylistImplCopyWith(
    _$PlaylistImpl value,
    $Res Function(_$PlaylistImpl) then,
  ) = __$$PlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? comment,
    int? songCount,
    int? duration,
    String? coverArt,
  });
}

/// @nodoc
class __$$PlaylistImplCopyWithImpl<$Res>
    extends _$PlaylistCopyWithImpl<$Res, _$PlaylistImpl>
    implements _$$PlaylistImplCopyWith<$Res> {
  __$$PlaylistImplCopyWithImpl(
    _$PlaylistImpl _value,
    $Res Function(_$PlaylistImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? comment = freezed,
    Object? songCount = freezed,
    Object? duration = freezed,
    Object? coverArt = freezed,
  }) {
    return _then(
      _$PlaylistImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        songCount: freezed == songCount
            ? _value.songCount
            : songCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int?,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistImpl implements _Playlist {
  const _$PlaylistImpl({
    required this.id,
    required this.name,
    this.comment,
    this.songCount,
    this.duration,
    this.coverArt,
  });

  factory _$PlaylistImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? comment;
  @override
  final int? songCount;
  @override
  final int? duration;
  @override
  final String? coverArt;

  @override
  String toString() {
    return 'Playlist(id: $id, name: $name, comment: $comment, songCount: $songCount, duration: $duration, coverArt: $coverArt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    comment,
    songCount,
    duration,
    coverArt,
  );

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      __$$PlaylistImplCopyWithImpl<_$PlaylistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistImplToJson(this);
  }
}

abstract class _Playlist implements Playlist {
  const factory _Playlist({
    required final String id,
    required final String name,
    final String? comment,
    final int? songCount,
    final int? duration,
    final String? coverArt,
  }) = _$PlaylistImpl;

  factory _Playlist.fromJson(Map<String, dynamic> json) =
      _$PlaylistImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get comment;
  @override
  int? get songCount;
  @override
  int? get duration;
  @override
  String? get coverArt;

  /// Create a copy of Playlist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaylistDetail _$PlaylistDetailFromJson(Map<String, dynamic> json) {
  return _PlaylistDetail.fromJson(json);
}

/// @nodoc
mixin _$PlaylistDetail {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int? get songCount => throw _privateConstructorUsedError;
  String? get coverArt => throw _privateConstructorUsedError;
  List<Song> get entries => throw _privateConstructorUsedError;

  /// Serializes this PlaylistDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaylistDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistDetailCopyWith<PlaylistDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistDetailCopyWith<$Res> {
  factory $PlaylistDetailCopyWith(
    PlaylistDetail value,
    $Res Function(PlaylistDetail) then,
  ) = _$PlaylistDetailCopyWithImpl<$Res, PlaylistDetail>;
  @useResult
  $Res call({
    String id,
    String name,
    String? comment,
    int? songCount,
    String? coverArt,
    List<Song> entries,
  });
}

/// @nodoc
class _$PlaylistDetailCopyWithImpl<$Res, $Val extends PlaylistDetail>
    implements $PlaylistDetailCopyWith<$Res> {
  _$PlaylistDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? comment = freezed,
    Object? songCount = freezed,
    Object? coverArt = freezed,
    Object? entries = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            songCount: freezed == songCount
                ? _value.songCount
                : songCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            coverArt: freezed == coverArt
                ? _value.coverArt
                : coverArt // ignore: cast_nullable_to_non_nullable
                      as String?,
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<Song>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlaylistDetailImplCopyWith<$Res>
    implements $PlaylistDetailCopyWith<$Res> {
  factory _$$PlaylistDetailImplCopyWith(
    _$PlaylistDetailImpl value,
    $Res Function(_$PlaylistDetailImpl) then,
  ) = __$$PlaylistDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? comment,
    int? songCount,
    String? coverArt,
    List<Song> entries,
  });
}

/// @nodoc
class __$$PlaylistDetailImplCopyWithImpl<$Res>
    extends _$PlaylistDetailCopyWithImpl<$Res, _$PlaylistDetailImpl>
    implements _$$PlaylistDetailImplCopyWith<$Res> {
  __$$PlaylistDetailImplCopyWithImpl(
    _$PlaylistDetailImpl _value,
    $Res Function(_$PlaylistDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaylistDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? comment = freezed,
    Object? songCount = freezed,
    Object? coverArt = freezed,
    Object? entries = null,
  }) {
    return _then(
      _$PlaylistDetailImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        songCount: freezed == songCount
            ? _value.songCount
            : songCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        coverArt: freezed == coverArt
            ? _value.coverArt
            : coverArt // ignore: cast_nullable_to_non_nullable
                  as String?,
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<Song>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistDetailImpl implements _PlaylistDetail {
  const _$PlaylistDetailImpl({
    required this.id,
    required this.name,
    this.comment,
    this.songCount,
    this.coverArt,
    final List<Song> entries = const [],
  }) : _entries = entries;

  factory _$PlaylistDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistDetailImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? comment;
  @override
  final int? songCount;
  @override
  final String? coverArt;
  final List<Song> _entries;
  @override
  @JsonKey()
  List<Song> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'PlaylistDetail(id: $id, name: $name, comment: $comment, songCount: $songCount, coverArt: $coverArt, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.coverArt, coverArt) ||
                other.coverArt == coverArt) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    comment,
    songCount,
    coverArt,
    const DeepCollectionEquality().hash(_entries),
  );

  /// Create a copy of PlaylistDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistDetailImplCopyWith<_$PlaylistDetailImpl> get copyWith =>
      __$$PlaylistDetailImplCopyWithImpl<_$PlaylistDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistDetailImplToJson(this);
  }
}

abstract class _PlaylistDetail implements PlaylistDetail {
  const factory _PlaylistDetail({
    required final String id,
    required final String name,
    final String? comment,
    final int? songCount,
    final String? coverArt,
    final List<Song> entries,
  }) = _$PlaylistDetailImpl;

  factory _PlaylistDetail.fromJson(Map<String, dynamic> json) =
      _$PlaylistDetailImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get comment;
  @override
  int? get songCount;
  @override
  String? get coverArt;
  @override
  List<Song> get entries;

  /// Create a copy of PlaylistDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistDetailImplCopyWith<_$PlaylistDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Starred2Result _$Starred2ResultFromJson(Map<String, dynamic> json) {
  return _Starred2Result.fromJson(json);
}

/// @nodoc
mixin _$Starred2Result {
  List<Song> get song => throw _privateConstructorUsedError;
  List<Album> get album => throw _privateConstructorUsedError;
  List<Artist> get artist => throw _privateConstructorUsedError;

  /// Serializes this Starred2Result to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Starred2Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Starred2ResultCopyWith<Starred2Result> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Starred2ResultCopyWith<$Res> {
  factory $Starred2ResultCopyWith(
    Starred2Result value,
    $Res Function(Starred2Result) then,
  ) = _$Starred2ResultCopyWithImpl<$Res, Starred2Result>;
  @useResult
  $Res call({List<Song> song, List<Album> album, List<Artist> artist});
}

/// @nodoc
class _$Starred2ResultCopyWithImpl<$Res, $Val extends Starred2Result>
    implements $Starred2ResultCopyWith<$Res> {
  _$Starred2ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Starred2Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? album = null,
    Object? artist = null,
  }) {
    return _then(
      _value.copyWith(
            song: null == song
                ? _value.song
                : song // ignore: cast_nullable_to_non_nullable
                      as List<Song>,
            album: null == album
                ? _value.album
                : album // ignore: cast_nullable_to_non_nullable
                      as List<Album>,
            artist: null == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as List<Artist>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Starred2ResultImplCopyWith<$Res>
    implements $Starred2ResultCopyWith<$Res> {
  factory _$$Starred2ResultImplCopyWith(
    _$Starred2ResultImpl value,
    $Res Function(_$Starred2ResultImpl) then,
  ) = __$$Starred2ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Song> song, List<Album> album, List<Artist> artist});
}

/// @nodoc
class __$$Starred2ResultImplCopyWithImpl<$Res>
    extends _$Starred2ResultCopyWithImpl<$Res, _$Starred2ResultImpl>
    implements _$$Starred2ResultImplCopyWith<$Res> {
  __$$Starred2ResultImplCopyWithImpl(
    _$Starred2ResultImpl _value,
    $Res Function(_$Starred2ResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Starred2Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = null,
    Object? album = null,
    Object? artist = null,
  }) {
    return _then(
      _$Starred2ResultImpl(
        song: null == song
            ? _value._song
            : song // ignore: cast_nullable_to_non_nullable
                  as List<Song>,
        album: null == album
            ? _value._album
            : album // ignore: cast_nullable_to_non_nullable
                  as List<Album>,
        artist: null == artist
            ? _value._artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as List<Artist>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$Starred2ResultImpl implements _Starred2Result {
  const _$Starred2ResultImpl({
    final List<Song> song = const [],
    final List<Album> album = const [],
    final List<Artist> artist = const [],
  }) : _song = song,
       _album = album,
       _artist = artist;

  factory _$Starred2ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$Starred2ResultImplFromJson(json);

  final List<Song> _song;
  @override
  @JsonKey()
  List<Song> get song {
    if (_song is EqualUnmodifiableListView) return _song;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_song);
  }

  final List<Album> _album;
  @override
  @JsonKey()
  List<Album> get album {
    if (_album is EqualUnmodifiableListView) return _album;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_album);
  }

  final List<Artist> _artist;
  @override
  @JsonKey()
  List<Artist> get artist {
    if (_artist is EqualUnmodifiableListView) return _artist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artist);
  }

  @override
  String toString() {
    return 'Starred2Result(song: $song, album: $album, artist: $artist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Starred2ResultImpl &&
            const DeepCollectionEquality().equals(other._song, _song) &&
            const DeepCollectionEquality().equals(other._album, _album) &&
            const DeepCollectionEquality().equals(other._artist, _artist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_song),
    const DeepCollectionEquality().hash(_album),
    const DeepCollectionEquality().hash(_artist),
  );

  /// Create a copy of Starred2Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Starred2ResultImplCopyWith<_$Starred2ResultImpl> get copyWith =>
      __$$Starred2ResultImplCopyWithImpl<_$Starred2ResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$Starred2ResultImplToJson(this);
  }
}

abstract class _Starred2Result implements Starred2Result {
  const factory _Starred2Result({
    final List<Song> song,
    final List<Album> album,
    final List<Artist> artist,
  }) = _$Starred2ResultImpl;

  factory _Starred2Result.fromJson(Map<String, dynamic> json) =
      _$Starred2ResultImpl.fromJson;

  @override
  List<Song> get song;
  @override
  List<Album> get album;
  @override
  List<Artist> get artist;

  /// Create a copy of Starred2Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Starred2ResultImplCopyWith<_$Starred2ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  List<Artist> get artist => throw _privateConstructorUsedError;
  List<Album> get album => throw _privateConstructorUsedError;
  List<Song> get song => throw _privateConstructorUsedError;

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
    SearchResult value,
    $Res Function(SearchResult) then,
  ) = _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call({List<Artist> artist, List<Album> album, List<Song> song});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? album = null,
    Object? song = null,
  }) {
    return _then(
      _value.copyWith(
            artist: null == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as List<Artist>,
            album: null == album
                ? _value.album
                : album // ignore: cast_nullable_to_non_nullable
                      as List<Album>,
            song: null == song
                ? _value.song
                : song // ignore: cast_nullable_to_non_nullable
                      as List<Song>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
    _$SearchResultImpl value,
    $Res Function(_$SearchResultImpl) then,
  ) = __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artist> artist, List<Album> album, List<Song> song});
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
    _$SearchResultImpl _value,
    $Res Function(_$SearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artist = null,
    Object? album = null,
    Object? song = null,
  }) {
    return _then(
      _$SearchResultImpl(
        artist: null == artist
            ? _value._artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as List<Artist>,
        album: null == album
            ? _value._album
            : album // ignore: cast_nullable_to_non_nullable
                  as List<Album>,
        song: null == song
            ? _value._song
            : song // ignore: cast_nullable_to_non_nullable
                  as List<Song>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl({
    final List<Artist> artist = const [],
    final List<Album> album = const [],
    final List<Song> song = const [],
  }) : _artist = artist,
       _album = album,
       _song = song;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  final List<Artist> _artist;
  @override
  @JsonKey()
  List<Artist> get artist {
    if (_artist is EqualUnmodifiableListView) return _artist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artist);
  }

  final List<Album> _album;
  @override
  @JsonKey()
  List<Album> get album {
    if (_album is EqualUnmodifiableListView) return _album;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_album);
  }

  final List<Song> _song;
  @override
  @JsonKey()
  List<Song> get song {
    if (_song is EqualUnmodifiableListView) return _song;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_song);
  }

  @override
  String toString() {
    return 'SearchResult(artist: $artist, album: $album, song: $song)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            const DeepCollectionEquality().equals(other._artist, _artist) &&
            const DeepCollectionEquality().equals(other._album, _album) &&
            const DeepCollectionEquality().equals(other._song, _song));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_artist),
    const DeepCollectionEquality().hash(_album),
    const DeepCollectionEquality().hash(_song),
  );

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(this);
  }
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult({
    final List<Artist> artist,
    final List<Album> album,
    final List<Song> song,
  }) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  List<Artist> get artist;
  @override
  List<Album> get album;
  @override
  List<Song> get song;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
