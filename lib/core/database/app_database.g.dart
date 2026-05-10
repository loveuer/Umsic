// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedSongsTable extends CachedSongs
    with TableInfo<$CachedSongsTable, CachedSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedSongsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artistMeta = const VerificationMeta('artist');
  @override
  late final GeneratedColumn<String> artist = GeneratedColumn<String>(
    'artist',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _artistIdMeta = const VerificationMeta(
    'artistId',
  );
  @override
  late final GeneratedColumn<String> artistId = GeneratedColumn<String>(
    'artist_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumMeta = const VerificationMeta('album');
  @override
  late final GeneratedColumn<String> album = GeneratedColumn<String>(
    'album',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _albumIdMeta = const VerificationMeta(
    'albumId',
  );
  @override
  late final GeneratedColumn<String> albumId = GeneratedColumn<String>(
    'album_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverArtMeta = const VerificationMeta(
    'coverArt',
  );
  @override
  late final GeneratedColumn<String> coverArt = GeneratedColumn<String>(
    'cover_art',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMeta = const VerificationMeta(
    'duration',
  );
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
    'duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackMeta = const VerificationMeta('track');
  @override
  late final GeneratedColumn<int> track = GeneratedColumn<int>(
    'track',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<String> genre = GeneratedColumn<String>(
    'genre',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentTypeMeta = const VerificationMeta(
    'contentType',
  );
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
    'content_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _suffixMeta = const VerificationMeta('suffix');
  @override
  late final GeneratedColumn<String> suffix = GeneratedColumn<String>(
    'suffix',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bitRateMeta = const VerificationMeta(
    'bitRate',
  );
  @override
  late final GeneratedColumn<int> bitRate = GeneratedColumn<int>(
    'bit_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _starredMeta = const VerificationMeta(
    'starred',
  );
  @override
  late final GeneratedColumn<bool> starred = GeneratedColumn<bool>(
    'starred',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("starred" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<int> cachedAt = GeneratedColumn<int>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastAccessedAtMeta = const VerificationMeta(
    'lastAccessedAt',
  );
  @override
  late final GeneratedColumn<int> lastAccessedAt = GeneratedColumn<int>(
    'last_accessed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDownloadMeta = const VerificationMeta(
    'isDownload',
  );
  @override
  late final GeneratedColumn<bool> isDownload = GeneratedColumn<bool>(
    'is_download',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_download" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
    cachedAt,
    lastAccessedAt,
    filePath,
    isDownload,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_songs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedSong> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('artist')) {
      context.handle(
        _artistMeta,
        artist.isAcceptableOrUnknown(data['artist']!, _artistMeta),
      );
    }
    if (data.containsKey('artist_id')) {
      context.handle(
        _artistIdMeta,
        artistId.isAcceptableOrUnknown(data['artist_id']!, _artistIdMeta),
      );
    }
    if (data.containsKey('album')) {
      context.handle(
        _albumMeta,
        album.isAcceptableOrUnknown(data['album']!, _albumMeta),
      );
    }
    if (data.containsKey('album_id')) {
      context.handle(
        _albumIdMeta,
        albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta),
      );
    }
    if (data.containsKey('cover_art')) {
      context.handle(
        _coverArtMeta,
        coverArt.isAcceptableOrUnknown(data['cover_art']!, _coverArtMeta),
      );
    }
    if (data.containsKey('duration')) {
      context.handle(
        _durationMeta,
        duration.isAcceptableOrUnknown(data['duration']!, _durationMeta),
      );
    }
    if (data.containsKey('track')) {
      context.handle(
        _trackMeta,
        track.isAcceptableOrUnknown(data['track']!, _trackMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('genre')) {
      context.handle(
        _genreMeta,
        genre.isAcceptableOrUnknown(data['genre']!, _genreMeta),
      );
    }
    if (data.containsKey('content_type')) {
      context.handle(
        _contentTypeMeta,
        contentType.isAcceptableOrUnknown(
          data['content_type']!,
          _contentTypeMeta,
        ),
      );
    }
    if (data.containsKey('suffix')) {
      context.handle(
        _suffixMeta,
        suffix.isAcceptableOrUnknown(data['suffix']!, _suffixMeta),
      );
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    }
    if (data.containsKey('bit_rate')) {
      context.handle(
        _bitRateMeta,
        bitRate.isAcceptableOrUnknown(data['bit_rate']!, _bitRateMeta),
      );
    }
    if (data.containsKey('starred')) {
      context.handle(
        _starredMeta,
        starred.isAcceptableOrUnknown(data['starred']!, _starredMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('last_accessed_at')) {
      context.handle(
        _lastAccessedAtMeta,
        lastAccessedAt.isAcceptableOrUnknown(
          data['last_accessed_at']!,
          _lastAccessedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastAccessedAtMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('is_download')) {
      context.handle(
        _isDownloadMeta,
        isDownload.isAcceptableOrUnknown(data['is_download']!, _isDownloadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedSong(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      artist: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist'],
      ),
      artistId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}artist_id'],
      ),
      album: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album'],
      ),
      albumId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}album_id'],
      ),
      coverArt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_art'],
      ),
      duration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration'],
      ),
      track: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}track'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      genre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}genre'],
      ),
      contentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_type'],
      ),
      suffix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}suffix'],
      ),
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      ),
      bitRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bit_rate'],
      ),
      starred: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}starred'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cached_at'],
      )!,
      lastAccessedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_accessed_at'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      isDownload: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_download'],
      )!,
    );
  }

  @override
  $CachedSongsTable createAlias(String alias) {
    return $CachedSongsTable(attachedDatabase, alias);
  }
}

class CachedSong extends DataClass implements Insertable<CachedSong> {
  final String id;
  final String title;
  final String? artist;
  final String? artistId;
  final String? album;
  final String? albumId;
  final String? coverArt;
  final int? duration;
  final int? track;
  final int? year;
  final String? genre;
  final String? contentType;
  final String? suffix;
  final int? size;
  final int? bitRate;
  final bool starred;
  final int cachedAt;
  final int lastAccessedAt;
  final String filePath;
  final bool isDownload;
  const CachedSong({
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
    required this.starred,
    required this.cachedAt,
    required this.lastAccessedAt,
    required this.filePath,
    required this.isDownload,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || artist != null) {
      map['artist'] = Variable<String>(artist);
    }
    if (!nullToAbsent || artistId != null) {
      map['artist_id'] = Variable<String>(artistId);
    }
    if (!nullToAbsent || album != null) {
      map['album'] = Variable<String>(album);
    }
    if (!nullToAbsent || albumId != null) {
      map['album_id'] = Variable<String>(albumId);
    }
    if (!nullToAbsent || coverArt != null) {
      map['cover_art'] = Variable<String>(coverArt);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || track != null) {
      map['track'] = Variable<int>(track);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || genre != null) {
      map['genre'] = Variable<String>(genre);
    }
    if (!nullToAbsent || contentType != null) {
      map['content_type'] = Variable<String>(contentType);
    }
    if (!nullToAbsent || suffix != null) {
      map['suffix'] = Variable<String>(suffix);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    if (!nullToAbsent || bitRate != null) {
      map['bit_rate'] = Variable<int>(bitRate);
    }
    map['starred'] = Variable<bool>(starred);
    map['cached_at'] = Variable<int>(cachedAt);
    map['last_accessed_at'] = Variable<int>(lastAccessedAt);
    map['file_path'] = Variable<String>(filePath);
    map['is_download'] = Variable<bool>(isDownload);
    return map;
  }

  CachedSongsCompanion toCompanion(bool nullToAbsent) {
    return CachedSongsCompanion(
      id: Value(id),
      title: Value(title),
      artist: artist == null && nullToAbsent
          ? const Value.absent()
          : Value(artist),
      artistId: artistId == null && nullToAbsent
          ? const Value.absent()
          : Value(artistId),
      album: album == null && nullToAbsent
          ? const Value.absent()
          : Value(album),
      albumId: albumId == null && nullToAbsent
          ? const Value.absent()
          : Value(albumId),
      coverArt: coverArt == null && nullToAbsent
          ? const Value.absent()
          : Value(coverArt),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      track: track == null && nullToAbsent
          ? const Value.absent()
          : Value(track),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      genre: genre == null && nullToAbsent
          ? const Value.absent()
          : Value(genre),
      contentType: contentType == null && nullToAbsent
          ? const Value.absent()
          : Value(contentType),
      suffix: suffix == null && nullToAbsent
          ? const Value.absent()
          : Value(suffix),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
      bitRate: bitRate == null && nullToAbsent
          ? const Value.absent()
          : Value(bitRate),
      starred: Value(starred),
      cachedAt: Value(cachedAt),
      lastAccessedAt: Value(lastAccessedAt),
      filePath: Value(filePath),
      isDownload: Value(isDownload),
    );
  }

  factory CachedSong.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedSong(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      artist: serializer.fromJson<String?>(json['artist']),
      artistId: serializer.fromJson<String?>(json['artistId']),
      album: serializer.fromJson<String?>(json['album']),
      albumId: serializer.fromJson<String?>(json['albumId']),
      coverArt: serializer.fromJson<String?>(json['coverArt']),
      duration: serializer.fromJson<int?>(json['duration']),
      track: serializer.fromJson<int?>(json['track']),
      year: serializer.fromJson<int?>(json['year']),
      genre: serializer.fromJson<String?>(json['genre']),
      contentType: serializer.fromJson<String?>(json['contentType']),
      suffix: serializer.fromJson<String?>(json['suffix']),
      size: serializer.fromJson<int?>(json['size']),
      bitRate: serializer.fromJson<int?>(json['bitRate']),
      starred: serializer.fromJson<bool>(json['starred']),
      cachedAt: serializer.fromJson<int>(json['cachedAt']),
      lastAccessedAt: serializer.fromJson<int>(json['lastAccessedAt']),
      filePath: serializer.fromJson<String>(json['filePath']),
      isDownload: serializer.fromJson<bool>(json['isDownload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'artist': serializer.toJson<String?>(artist),
      'artistId': serializer.toJson<String?>(artistId),
      'album': serializer.toJson<String?>(album),
      'albumId': serializer.toJson<String?>(albumId),
      'coverArt': serializer.toJson<String?>(coverArt),
      'duration': serializer.toJson<int?>(duration),
      'track': serializer.toJson<int?>(track),
      'year': serializer.toJson<int?>(year),
      'genre': serializer.toJson<String?>(genre),
      'contentType': serializer.toJson<String?>(contentType),
      'suffix': serializer.toJson<String?>(suffix),
      'size': serializer.toJson<int?>(size),
      'bitRate': serializer.toJson<int?>(bitRate),
      'starred': serializer.toJson<bool>(starred),
      'cachedAt': serializer.toJson<int>(cachedAt),
      'lastAccessedAt': serializer.toJson<int>(lastAccessedAt),
      'filePath': serializer.toJson<String>(filePath),
      'isDownload': serializer.toJson<bool>(isDownload),
    };
  }

  CachedSong copyWith({
    String? id,
    String? title,
    Value<String?> artist = const Value.absent(),
    Value<String?> artistId = const Value.absent(),
    Value<String?> album = const Value.absent(),
    Value<String?> albumId = const Value.absent(),
    Value<String?> coverArt = const Value.absent(),
    Value<int?> duration = const Value.absent(),
    Value<int?> track = const Value.absent(),
    Value<int?> year = const Value.absent(),
    Value<String?> genre = const Value.absent(),
    Value<String?> contentType = const Value.absent(),
    Value<String?> suffix = const Value.absent(),
    Value<int?> size = const Value.absent(),
    Value<int?> bitRate = const Value.absent(),
    bool? starred,
    int? cachedAt,
    int? lastAccessedAt,
    String? filePath,
    bool? isDownload,
  }) => CachedSong(
    id: id ?? this.id,
    title: title ?? this.title,
    artist: artist.present ? artist.value : this.artist,
    artistId: artistId.present ? artistId.value : this.artistId,
    album: album.present ? album.value : this.album,
    albumId: albumId.present ? albumId.value : this.albumId,
    coverArt: coverArt.present ? coverArt.value : this.coverArt,
    duration: duration.present ? duration.value : this.duration,
    track: track.present ? track.value : this.track,
    year: year.present ? year.value : this.year,
    genre: genre.present ? genre.value : this.genre,
    contentType: contentType.present ? contentType.value : this.contentType,
    suffix: suffix.present ? suffix.value : this.suffix,
    size: size.present ? size.value : this.size,
    bitRate: bitRate.present ? bitRate.value : this.bitRate,
    starred: starred ?? this.starred,
    cachedAt: cachedAt ?? this.cachedAt,
    lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
    filePath: filePath ?? this.filePath,
    isDownload: isDownload ?? this.isDownload,
  );
  CachedSong copyWithCompanion(CachedSongsCompanion data) {
    return CachedSong(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      artist: data.artist.present ? data.artist.value : this.artist,
      artistId: data.artistId.present ? data.artistId.value : this.artistId,
      album: data.album.present ? data.album.value : this.album,
      albumId: data.albumId.present ? data.albumId.value : this.albumId,
      coverArt: data.coverArt.present ? data.coverArt.value : this.coverArt,
      duration: data.duration.present ? data.duration.value : this.duration,
      track: data.track.present ? data.track.value : this.track,
      year: data.year.present ? data.year.value : this.year,
      genre: data.genre.present ? data.genre.value : this.genre,
      contentType: data.contentType.present
          ? data.contentType.value
          : this.contentType,
      suffix: data.suffix.present ? data.suffix.value : this.suffix,
      size: data.size.present ? data.size.value : this.size,
      bitRate: data.bitRate.present ? data.bitRate.value : this.bitRate,
      starred: data.starred.present ? data.starred.value : this.starred,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      lastAccessedAt: data.lastAccessedAt.present
          ? data.lastAccessedAt.value
          : this.lastAccessedAt,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      isDownload: data.isDownload.present
          ? data.isDownload.value
          : this.isDownload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedSong(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('album: $album, ')
          ..write('albumId: $albumId, ')
          ..write('coverArt: $coverArt, ')
          ..write('duration: $duration, ')
          ..write('track: $track, ')
          ..write('year: $year, ')
          ..write('genre: $genre, ')
          ..write('contentType: $contentType, ')
          ..write('suffix: $suffix, ')
          ..write('size: $size, ')
          ..write('bitRate: $bitRate, ')
          ..write('starred: $starred, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('lastAccessedAt: $lastAccessedAt, ')
          ..write('filePath: $filePath, ')
          ..write('isDownload: $isDownload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
    cachedAt,
    lastAccessedAt,
    filePath,
    isDownload,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedSong &&
          other.id == this.id &&
          other.title == this.title &&
          other.artist == this.artist &&
          other.artistId == this.artistId &&
          other.album == this.album &&
          other.albumId == this.albumId &&
          other.coverArt == this.coverArt &&
          other.duration == this.duration &&
          other.track == this.track &&
          other.year == this.year &&
          other.genre == this.genre &&
          other.contentType == this.contentType &&
          other.suffix == this.suffix &&
          other.size == this.size &&
          other.bitRate == this.bitRate &&
          other.starred == this.starred &&
          other.cachedAt == this.cachedAt &&
          other.lastAccessedAt == this.lastAccessedAt &&
          other.filePath == this.filePath &&
          other.isDownload == this.isDownload);
}

class CachedSongsCompanion extends UpdateCompanion<CachedSong> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> artist;
  final Value<String?> artistId;
  final Value<String?> album;
  final Value<String?> albumId;
  final Value<String?> coverArt;
  final Value<int?> duration;
  final Value<int?> track;
  final Value<int?> year;
  final Value<String?> genre;
  final Value<String?> contentType;
  final Value<String?> suffix;
  final Value<int?> size;
  final Value<int?> bitRate;
  final Value<bool> starred;
  final Value<int> cachedAt;
  final Value<int> lastAccessedAt;
  final Value<String> filePath;
  final Value<bool> isDownload;
  final Value<int> rowid;
  const CachedSongsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.artist = const Value.absent(),
    this.artistId = const Value.absent(),
    this.album = const Value.absent(),
    this.albumId = const Value.absent(),
    this.coverArt = const Value.absent(),
    this.duration = const Value.absent(),
    this.track = const Value.absent(),
    this.year = const Value.absent(),
    this.genre = const Value.absent(),
    this.contentType = const Value.absent(),
    this.suffix = const Value.absent(),
    this.size = const Value.absent(),
    this.bitRate = const Value.absent(),
    this.starred = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.lastAccessedAt = const Value.absent(),
    this.filePath = const Value.absent(),
    this.isDownload = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedSongsCompanion.insert({
    required String id,
    required String title,
    this.artist = const Value.absent(),
    this.artistId = const Value.absent(),
    this.album = const Value.absent(),
    this.albumId = const Value.absent(),
    this.coverArt = const Value.absent(),
    this.duration = const Value.absent(),
    this.track = const Value.absent(),
    this.year = const Value.absent(),
    this.genre = const Value.absent(),
    this.contentType = const Value.absent(),
    this.suffix = const Value.absent(),
    this.size = const Value.absent(),
    this.bitRate = const Value.absent(),
    this.starred = const Value.absent(),
    required int cachedAt,
    required int lastAccessedAt,
    required String filePath,
    this.isDownload = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       cachedAt = Value(cachedAt),
       lastAccessedAt = Value(lastAccessedAt),
       filePath = Value(filePath);
  static Insertable<CachedSong> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? artist,
    Expression<String>? artistId,
    Expression<String>? album,
    Expression<String>? albumId,
    Expression<String>? coverArt,
    Expression<int>? duration,
    Expression<int>? track,
    Expression<int>? year,
    Expression<String>? genre,
    Expression<String>? contentType,
    Expression<String>? suffix,
    Expression<int>? size,
    Expression<int>? bitRate,
    Expression<bool>? starred,
    Expression<int>? cachedAt,
    Expression<int>? lastAccessedAt,
    Expression<String>? filePath,
    Expression<bool>? isDownload,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (artist != null) 'artist': artist,
      if (artistId != null) 'artist_id': artistId,
      if (album != null) 'album': album,
      if (albumId != null) 'album_id': albumId,
      if (coverArt != null) 'cover_art': coverArt,
      if (duration != null) 'duration': duration,
      if (track != null) 'track': track,
      if (year != null) 'year': year,
      if (genre != null) 'genre': genre,
      if (contentType != null) 'content_type': contentType,
      if (suffix != null) 'suffix': suffix,
      if (size != null) 'size': size,
      if (bitRate != null) 'bit_rate': bitRate,
      if (starred != null) 'starred': starred,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (lastAccessedAt != null) 'last_accessed_at': lastAccessedAt,
      if (filePath != null) 'file_path': filePath,
      if (isDownload != null) 'is_download': isDownload,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedSongsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? artist,
    Value<String?>? artistId,
    Value<String?>? album,
    Value<String?>? albumId,
    Value<String?>? coverArt,
    Value<int?>? duration,
    Value<int?>? track,
    Value<int?>? year,
    Value<String?>? genre,
    Value<String?>? contentType,
    Value<String?>? suffix,
    Value<int?>? size,
    Value<int?>? bitRate,
    Value<bool>? starred,
    Value<int>? cachedAt,
    Value<int>? lastAccessedAt,
    Value<String>? filePath,
    Value<bool>? isDownload,
    Value<int>? rowid,
  }) {
    return CachedSongsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      artistId: artistId ?? this.artistId,
      album: album ?? this.album,
      albumId: albumId ?? this.albumId,
      coverArt: coverArt ?? this.coverArt,
      duration: duration ?? this.duration,
      track: track ?? this.track,
      year: year ?? this.year,
      genre: genre ?? this.genre,
      contentType: contentType ?? this.contentType,
      suffix: suffix ?? this.suffix,
      size: size ?? this.size,
      bitRate: bitRate ?? this.bitRate,
      starred: starred ?? this.starred,
      cachedAt: cachedAt ?? this.cachedAt,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      filePath: filePath ?? this.filePath,
      isDownload: isDownload ?? this.isDownload,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (artist.present) {
      map['artist'] = Variable<String>(artist.value);
    }
    if (artistId.present) {
      map['artist_id'] = Variable<String>(artistId.value);
    }
    if (album.present) {
      map['album'] = Variable<String>(album.value);
    }
    if (albumId.present) {
      map['album_id'] = Variable<String>(albumId.value);
    }
    if (coverArt.present) {
      map['cover_art'] = Variable<String>(coverArt.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (track.present) {
      map['track'] = Variable<int>(track.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (genre.present) {
      map['genre'] = Variable<String>(genre.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (suffix.present) {
      map['suffix'] = Variable<String>(suffix.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (bitRate.present) {
      map['bit_rate'] = Variable<int>(bitRate.value);
    }
    if (starred.present) {
      map['starred'] = Variable<bool>(starred.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<int>(cachedAt.value);
    }
    if (lastAccessedAt.present) {
      map['last_accessed_at'] = Variable<int>(lastAccessedAt.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (isDownload.present) {
      map['is_download'] = Variable<bool>(isDownload.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedSongsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('artist: $artist, ')
          ..write('artistId: $artistId, ')
          ..write('album: $album, ')
          ..write('albumId: $albumId, ')
          ..write('coverArt: $coverArt, ')
          ..write('duration: $duration, ')
          ..write('track: $track, ')
          ..write('year: $year, ')
          ..write('genre: $genre, ')
          ..write('contentType: $contentType, ')
          ..write('suffix: $suffix, ')
          ..write('size: $size, ')
          ..write('bitRate: $bitRate, ')
          ..write('starred: $starred, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('lastAccessedAt: $lastAccessedAt, ')
          ..write('filePath: $filePath, ')
          ..write('isDownload: $isDownload, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedSongsTable cachedSongs = $CachedSongsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cachedSongs];
}

typedef $$CachedSongsTableCreateCompanionBuilder =
    CachedSongsCompanion Function({
      required String id,
      required String title,
      Value<String?> artist,
      Value<String?> artistId,
      Value<String?> album,
      Value<String?> albumId,
      Value<String?> coverArt,
      Value<int?> duration,
      Value<int?> track,
      Value<int?> year,
      Value<String?> genre,
      Value<String?> contentType,
      Value<String?> suffix,
      Value<int?> size,
      Value<int?> bitRate,
      Value<bool> starred,
      required int cachedAt,
      required int lastAccessedAt,
      required String filePath,
      Value<bool> isDownload,
      Value<int> rowid,
    });
typedef $$CachedSongsTableUpdateCompanionBuilder =
    CachedSongsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> artist,
      Value<String?> artistId,
      Value<String?> album,
      Value<String?> albumId,
      Value<String?> coverArt,
      Value<int?> duration,
      Value<int?> track,
      Value<int?> year,
      Value<String?> genre,
      Value<String?> contentType,
      Value<String?> suffix,
      Value<int?> size,
      Value<int?> bitRate,
      Value<bool> starred,
      Value<int> cachedAt,
      Value<int> lastAccessedAt,
      Value<String> filePath,
      Value<bool> isDownload,
      Value<int> rowid,
    });

class $$CachedSongsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedSongsTable> {
  $$CachedSongsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artistId => $composableBuilder(
    column: $table.artistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get albumId => $composableBuilder(
    column: $table.albumId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverArt => $composableBuilder(
    column: $table.coverArt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get suffix => $composableBuilder(
    column: $table.suffix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bitRate => $composableBuilder(
    column: $table.bitRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get starred => $composableBuilder(
    column: $table.starred,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDownload => $composableBuilder(
    column: $table.isDownload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedSongsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedSongsTable> {
  $$CachedSongsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artist => $composableBuilder(
    column: $table.artist,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artistId => $composableBuilder(
    column: $table.artistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get album => $composableBuilder(
    column: $table.album,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get albumId => $composableBuilder(
    column: $table.albumId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverArt => $composableBuilder(
    column: $table.coverArt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get duration => $composableBuilder(
    column: $table.duration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get track => $composableBuilder(
    column: $table.track,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genre => $composableBuilder(
    column: $table.genre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get suffix => $composableBuilder(
    column: $table.suffix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bitRate => $composableBuilder(
    column: $table.bitRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get starred => $composableBuilder(
    column: $table.starred,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDownload => $composableBuilder(
    column: $table.isDownload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedSongsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedSongsTable> {
  $$CachedSongsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get artist =>
      $composableBuilder(column: $table.artist, builder: (column) => column);

  GeneratedColumn<String> get artistId =>
      $composableBuilder(column: $table.artistId, builder: (column) => column);

  GeneratedColumn<String> get album =>
      $composableBuilder(column: $table.album, builder: (column) => column);

  GeneratedColumn<String> get albumId =>
      $composableBuilder(column: $table.albumId, builder: (column) => column);

  GeneratedColumn<String> get coverArt =>
      $composableBuilder(column: $table.coverArt, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<int> get track =>
      $composableBuilder(column: $table.track, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get genre =>
      $composableBuilder(column: $table.genre, builder: (column) => column);

  GeneratedColumn<String> get contentType => $composableBuilder(
    column: $table.contentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get suffix =>
      $composableBuilder(column: $table.suffix, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<int> get bitRate =>
      $composableBuilder(column: $table.bitRate, builder: (column) => column);

  GeneratedColumn<bool> get starred =>
      $composableBuilder(column: $table.starred, builder: (column) => column);

  GeneratedColumn<int> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<int> get lastAccessedAt => $composableBuilder(
    column: $table.lastAccessedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<bool> get isDownload => $composableBuilder(
    column: $table.isDownload,
    builder: (column) => column,
  );
}

class $$CachedSongsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedSongsTable,
          CachedSong,
          $$CachedSongsTableFilterComposer,
          $$CachedSongsTableOrderingComposer,
          $$CachedSongsTableAnnotationComposer,
          $$CachedSongsTableCreateCompanionBuilder,
          $$CachedSongsTableUpdateCompanionBuilder,
          (
            CachedSong,
            BaseReferences<_$AppDatabase, $CachedSongsTable, CachedSong>,
          ),
          CachedSong,
          PrefetchHooks Function()
        > {
  $$CachedSongsTableTableManager(_$AppDatabase db, $CachedSongsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedSongsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedSongsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedSongsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> artist = const Value.absent(),
                Value<String?> artistId = const Value.absent(),
                Value<String?> album = const Value.absent(),
                Value<String?> albumId = const Value.absent(),
                Value<String?> coverArt = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int?> track = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> genre = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> suffix = const Value.absent(),
                Value<int?> size = const Value.absent(),
                Value<int?> bitRate = const Value.absent(),
                Value<bool> starred = const Value.absent(),
                Value<int> cachedAt = const Value.absent(),
                Value<int> lastAccessedAt = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<bool> isDownload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSongsCompanion(
                id: id,
                title: title,
                artist: artist,
                artistId: artistId,
                album: album,
                albumId: albumId,
                coverArt: coverArt,
                duration: duration,
                track: track,
                year: year,
                genre: genre,
                contentType: contentType,
                suffix: suffix,
                size: size,
                bitRate: bitRate,
                starred: starred,
                cachedAt: cachedAt,
                lastAccessedAt: lastAccessedAt,
                filePath: filePath,
                isDownload: isDownload,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> artist = const Value.absent(),
                Value<String?> artistId = const Value.absent(),
                Value<String?> album = const Value.absent(),
                Value<String?> albumId = const Value.absent(),
                Value<String?> coverArt = const Value.absent(),
                Value<int?> duration = const Value.absent(),
                Value<int?> track = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> genre = const Value.absent(),
                Value<String?> contentType = const Value.absent(),
                Value<String?> suffix = const Value.absent(),
                Value<int?> size = const Value.absent(),
                Value<int?> bitRate = const Value.absent(),
                Value<bool> starred = const Value.absent(),
                required int cachedAt,
                required int lastAccessedAt,
                required String filePath,
                Value<bool> isDownload = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSongsCompanion.insert(
                id: id,
                title: title,
                artist: artist,
                artistId: artistId,
                album: album,
                albumId: albumId,
                coverArt: coverArt,
                duration: duration,
                track: track,
                year: year,
                genre: genre,
                contentType: contentType,
                suffix: suffix,
                size: size,
                bitRate: bitRate,
                starred: starred,
                cachedAt: cachedAt,
                lastAccessedAt: lastAccessedAt,
                filePath: filePath,
                isDownload: isDownload,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedSongsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedSongsTable,
      CachedSong,
      $$CachedSongsTableFilterComposer,
      $$CachedSongsTableOrderingComposer,
      $$CachedSongsTableAnnotationComposer,
      $$CachedSongsTableCreateCompanionBuilder,
      $$CachedSongsTableUpdateCompanionBuilder,
      (
        CachedSong,
        BaseReferences<_$AppDatabase, $CachedSongsTable, CachedSong>,
      ),
      CachedSong,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedSongsTableTableManager get cachedSongs =>
      $$CachedSongsTableTableManager(_db, _db.cachedSongs);
}
