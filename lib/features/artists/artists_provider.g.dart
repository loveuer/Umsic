// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistsHash() => r'1c8080bfeba4aa23754e646264edbdf168707a52';

/// See also [artists].
@ProviderFor(artists)
final artistsProvider = AutoDisposeFutureProvider<List<Artist>>.internal(
  artists,
  name: r'artistsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artistsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtistsRef = AutoDisposeFutureProviderRef<List<Artist>>;
String _$artistDetailHash() => r'1b0399f19e00f3663441bd4ce1e62cd26bac3d16';

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

/// See also [artistDetail].
@ProviderFor(artistDetail)
const artistDetailProvider = ArtistDetailFamily();

/// See also [artistDetail].
class ArtistDetailFamily extends Family<AsyncValue<ArtistDetail>> {
  /// See also [artistDetail].
  const ArtistDetailFamily();

  /// See also [artistDetail].
  ArtistDetailProvider call(String id) {
    return ArtistDetailProvider(id);
  }

  @override
  ArtistDetailProvider getProviderOverride(
    covariant ArtistDetailProvider provider,
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
  String? get name => r'artistDetailProvider';
}

/// See also [artistDetail].
class ArtistDetailProvider extends AutoDisposeFutureProvider<ArtistDetail> {
  /// See also [artistDetail].
  ArtistDetailProvider(String id)
    : this._internal(
        (ref) => artistDetail(ref as ArtistDetailRef, id),
        from: artistDetailProvider,
        name: r'artistDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$artistDetailHash,
        dependencies: ArtistDetailFamily._dependencies,
        allTransitiveDependencies:
            ArtistDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ArtistDetailProvider._internal(
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
    FutureOr<ArtistDetail> Function(ArtistDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistDetailProvider._internal(
        (ref) => create(ref as ArtistDetailRef),
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
  AutoDisposeFutureProviderElement<ArtistDetail> createElement() {
    return _ArtistDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistDetailProvider && other.id == id;
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
mixin ArtistDetailRef on AutoDisposeFutureProviderRef<ArtistDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ArtistDetailProviderElement
    extends AutoDisposeFutureProviderElement<ArtistDetail>
    with ArtistDetailRef {
  _ArtistDetailProviderElement(super.provider);

  @override
  String get id => (origin as ArtistDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
