// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playlistsHash() => r'96db04f18563e7f32c15d1a17eff247407493807';

/// See also [playlists].
@ProviderFor(playlists)
final playlistsProvider = AutoDisposeFutureProvider<List<Playlist>>.internal(
  playlists,
  name: r'playlistsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playlistsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlaylistsRef = AutoDisposeFutureProviderRef<List<Playlist>>;
String _$playlistDetailHash() => r'c69e973ba019234711757e166fcdda65967c9c60';

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

/// See also [playlistDetail].
@ProviderFor(playlistDetail)
const playlistDetailProvider = PlaylistDetailFamily();

/// See also [playlistDetail].
class PlaylistDetailFamily extends Family<AsyncValue<PlaylistDetail>> {
  /// See also [playlistDetail].
  const PlaylistDetailFamily();

  /// See also [playlistDetail].
  PlaylistDetailProvider call(String id) {
    return PlaylistDetailProvider(id);
  }

  @override
  PlaylistDetailProvider getProviderOverride(
    covariant PlaylistDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playlistDetailProvider';
}

/// See also [playlistDetail].
class PlaylistDetailProvider extends AutoDisposeFutureProvider<PlaylistDetail> {
  /// See also [playlistDetail].
  PlaylistDetailProvider(String id)
    : this._internal(
        (ref) => playlistDetail(ref as PlaylistDetailRef, id),
        from: playlistDetailProvider,
        name: r'playlistDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$playlistDetailHash,
        dependencies: PlaylistDetailFamily._dependencies,
        allTransitiveDependencies:
            PlaylistDetailFamily._allTransitiveDependencies,
        id: id,
      );

  PlaylistDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<PlaylistDetail> Function(PlaylistDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaylistDetailProvider._internal(
        (ref) => create(ref as PlaylistDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlaylistDetail> createElement() {
    return _PlaylistDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaylistDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlaylistDetailRef on AutoDisposeFutureProviderRef<PlaylistDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PlaylistDetailProviderElement
    extends AutoDisposeFutureProviderElement<PlaylistDetail>
    with PlaylistDetailRef {
  _PlaylistDetailProviderElement(super.provider);

  @override
  String get id => (origin as PlaylistDetailProvider).id;
}

String _$starredSongsHash() => r'3d587790fe8737c623acf11a5e00ec5186a0159e';

/// See also [StarredSongs].
@ProviderFor(StarredSongs)
final starredSongsProvider =
    AsyncNotifierProvider<StarredSongs, Set<String>>.internal(
      StarredSongs.new,
      name: r'starredSongsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$starredSongsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$StarredSongs = AsyncNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
