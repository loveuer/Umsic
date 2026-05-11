// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'a15319ddfa56ae026d7331e71464e6db2debddff';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$cachedCoverArtPathHash() =>
    r'bac1ef46203d431c7eb4a80473d58acad302bcb0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Look up a cached song's local cover art path by ID. Returns null if not cached.
///
/// Copied from [cachedCoverArtPath].
@ProviderFor(cachedCoverArtPath)
const cachedCoverArtPathProvider = CachedCoverArtPathFamily();

/// Look up a cached song's local cover art path by ID. Returns null if not cached.
///
/// Copied from [cachedCoverArtPath].
class CachedCoverArtPathFamily extends Family<AsyncValue<String?>> {
  /// Look up a cached song's local cover art path by ID. Returns null if not cached.
  ///
  /// Copied from [cachedCoverArtPath].
  const CachedCoverArtPathFamily();

  /// Look up a cached song's local cover art path by ID. Returns null if not cached.
  ///
  /// Copied from [cachedCoverArtPath].
  CachedCoverArtPathProvider call(String songId) {
    return CachedCoverArtPathProvider(songId);
  }

  @override
  CachedCoverArtPathProvider getProviderOverride(
    covariant CachedCoverArtPathProvider provider,
  ) {
    return call(provider.songId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cachedCoverArtPathProvider';
}

/// Look up a cached song's local cover art path by ID. Returns null if not cached.
///
/// Copied from [cachedCoverArtPath].
class CachedCoverArtPathProvider extends AutoDisposeFutureProvider<String?> {
  /// Look up a cached song's local cover art path by ID. Returns null if not cached.
  ///
  /// Copied from [cachedCoverArtPath].
  CachedCoverArtPathProvider(String songId)
    : this._internal(
        (ref) => cachedCoverArtPath(ref as CachedCoverArtPathRef, songId),
        from: cachedCoverArtPathProvider,
        name: r'cachedCoverArtPathProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$cachedCoverArtPathHash,
        dependencies: CachedCoverArtPathFamily._dependencies,
        allTransitiveDependencies:
            CachedCoverArtPathFamily._allTransitiveDependencies,
        songId: songId,
      );

  CachedCoverArtPathProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.songId,
  }) : super.internal();

  final String songId;

  @override
  Override overrideWith(
    FutureOr<String?> Function(CachedCoverArtPathRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CachedCoverArtPathProvider._internal(
        (ref) => create(ref as CachedCoverArtPathRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        songId: songId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _CachedCoverArtPathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CachedCoverArtPathProvider && other.songId == songId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, songId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CachedCoverArtPathRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `songId` of this provider.
  String get songId;
}

class _CachedCoverArtPathProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with CachedCoverArtPathRef {
  _CachedCoverArtPathProviderElement(super.provider);

  @override
  String get songId => (origin as CachedCoverArtPathProvider).songId;
}

String _$cachedLyricsJsonHash() => r'b390e5ffbd2ff1199d9e84c068ac5c3f9fa3647c';

/// Look up cached lyrics JSON by song ID. Returns null if not cached.
///
/// Copied from [cachedLyricsJson].
@ProviderFor(cachedLyricsJson)
const cachedLyricsJsonProvider = CachedLyricsJsonFamily();

/// Look up cached lyrics JSON by song ID. Returns null if not cached.
///
/// Copied from [cachedLyricsJson].
class CachedLyricsJsonFamily extends Family<AsyncValue<String?>> {
  /// Look up cached lyrics JSON by song ID. Returns null if not cached.
  ///
  /// Copied from [cachedLyricsJson].
  const CachedLyricsJsonFamily();

  /// Look up cached lyrics JSON by song ID. Returns null if not cached.
  ///
  /// Copied from [cachedLyricsJson].
  CachedLyricsJsonProvider call(String songId) {
    return CachedLyricsJsonProvider(songId);
  }

  @override
  CachedLyricsJsonProvider getProviderOverride(
    covariant CachedLyricsJsonProvider provider,
  ) {
    return call(provider.songId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cachedLyricsJsonProvider';
}

/// Look up cached lyrics JSON by song ID. Returns null if not cached.
///
/// Copied from [cachedLyricsJson].
class CachedLyricsJsonProvider extends AutoDisposeFutureProvider<String?> {
  /// Look up cached lyrics JSON by song ID. Returns null if not cached.
  ///
  /// Copied from [cachedLyricsJson].
  CachedLyricsJsonProvider(String songId)
    : this._internal(
        (ref) => cachedLyricsJson(ref as CachedLyricsJsonRef, songId),
        from: cachedLyricsJsonProvider,
        name: r'cachedLyricsJsonProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$cachedLyricsJsonHash,
        dependencies: CachedLyricsJsonFamily._dependencies,
        allTransitiveDependencies:
            CachedLyricsJsonFamily._allTransitiveDependencies,
        songId: songId,
      );

  CachedLyricsJsonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.songId,
  }) : super.internal();

  final String songId;

  @override
  Override overrideWith(
    FutureOr<String?> Function(CachedLyricsJsonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CachedLyricsJsonProvider._internal(
        (ref) => create(ref as CachedLyricsJsonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        songId: songId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _CachedLyricsJsonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CachedLyricsJsonProvider && other.songId == songId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, songId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CachedLyricsJsonRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `songId` of this provider.
  String get songId;
}

class _CachedLyricsJsonProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with CachedLyricsJsonRef {
  _CachedLyricsJsonProviderElement(super.provider);

  @override
  String get songId => (origin as CachedLyricsJsonProvider).songId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
