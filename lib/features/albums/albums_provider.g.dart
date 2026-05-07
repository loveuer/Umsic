// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$albumsHash() => r'5340559d5626b98b83f388fe3c667af19626449f';

/// See also [albums].
@ProviderFor(albums)
final albumsProvider = AutoDisposeFutureProvider<List<Album>>.internal(
  albums,
  name: r'albumsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$albumsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AlbumsRef = AutoDisposeFutureProviderRef<List<Album>>;
String _$albumDetailHash() => r'9b36d597c0d9536bcd81df4b22de29af2340cd6b';

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

/// See also [albumDetail].
@ProviderFor(albumDetail)
const albumDetailProvider = AlbumDetailFamily();

/// See also [albumDetail].
class AlbumDetailFamily extends Family<AsyncValue<AlbumDetail>> {
  /// See also [albumDetail].
  const AlbumDetailFamily();

  /// See also [albumDetail].
  AlbumDetailProvider call(String id) {
    return AlbumDetailProvider(id);
  }

  @override
  AlbumDetailProvider getProviderOverride(
    covariant AlbumDetailProvider provider,
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
  String? get name => r'albumDetailProvider';
}

/// See also [albumDetail].
class AlbumDetailProvider extends AutoDisposeFutureProvider<AlbumDetail> {
  /// See also [albumDetail].
  AlbumDetailProvider(String id)
    : this._internal(
        (ref) => albumDetail(ref as AlbumDetailRef, id),
        from: albumDetailProvider,
        name: r'albumDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$albumDetailHash,
        dependencies: AlbumDetailFamily._dependencies,
        allTransitiveDependencies: AlbumDetailFamily._allTransitiveDependencies,
        id: id,
      );

  AlbumDetailProvider._internal(
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
    FutureOr<AlbumDetail> Function(AlbumDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AlbumDetailProvider._internal(
        (ref) => create(ref as AlbumDetailRef),
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
  AutoDisposeFutureProviderElement<AlbumDetail> createElement() {
    return _AlbumDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumDetailProvider && other.id == id;
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
mixin AlbumDetailRef on AutoDisposeFutureProviderRef<AlbumDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AlbumDetailProviderElement
    extends AutoDisposeFutureProviderElement<AlbumDetail>
    with AlbumDetailRef {
  _AlbumDetailProviderElement(super.provider);

  @override
  String get id => (origin as AlbumDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
