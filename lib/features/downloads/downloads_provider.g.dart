// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cachedSongsHash() => r'805502806ba7ebb26bb00b4fa5b7932d4811bc8d';

/// Watch all cached songs reactively via drift's built-in change notification.
///
/// Copied from [cachedSongs].
@ProviderFor(cachedSongs)
final cachedSongsProvider =
    AutoDisposeStreamProvider<List<CachedSong>>.internal(
      cachedSongs,
      name: r'cachedSongsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cachedSongsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CachedSongsRef = AutoDisposeStreamProviderRef<List<CachedSong>>;
String _$deleteCachedSongHash() => r'38a54cfb1a00fbd6c2cbf8f65e35606cbdc81281';

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

abstract class _$DeleteCachedSong
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String songId;

  FutureOr<void> build(String songId);
}

/// See also [DeleteCachedSong].
@ProviderFor(DeleteCachedSong)
const deleteCachedSongProvider = DeleteCachedSongFamily();

/// See also [DeleteCachedSong].
class DeleteCachedSongFamily extends Family<AsyncValue<void>> {
  /// See also [DeleteCachedSong].
  const DeleteCachedSongFamily();

  /// See also [DeleteCachedSong].
  DeleteCachedSongProvider call(String songId) {
    return DeleteCachedSongProvider(songId);
  }

  @override
  DeleteCachedSongProvider getProviderOverride(
    covariant DeleteCachedSongProvider provider,
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
  String? get name => r'deleteCachedSongProvider';
}

/// See also [DeleteCachedSong].
class DeleteCachedSongProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DeleteCachedSong, void> {
  /// See also [DeleteCachedSong].
  DeleteCachedSongProvider(String songId)
    : this._internal(
        () => DeleteCachedSong()..songId = songId,
        from: deleteCachedSongProvider,
        name: r'deleteCachedSongProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$deleteCachedSongHash,
        dependencies: DeleteCachedSongFamily._dependencies,
        allTransitiveDependencies:
            DeleteCachedSongFamily._allTransitiveDependencies,
        songId: songId,
      );

  DeleteCachedSongProvider._internal(
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
  FutureOr<void> runNotifierBuild(covariant DeleteCachedSong notifier) {
    return notifier.build(songId);
  }

  @override
  Override overrideWith(DeleteCachedSong Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeleteCachedSongProvider._internal(
        () => create()..songId = songId,
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
  AutoDisposeAsyncNotifierProviderElement<DeleteCachedSong, void>
  createElement() {
    return _DeleteCachedSongProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCachedSongProvider && other.songId == songId;
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
mixin DeleteCachedSongRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `songId` of this provider.
  String get songId;
}

class _DeleteCachedSongProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeleteCachedSong, void>
    with DeleteCachedSongRef {
  _DeleteCachedSongProviderElement(super.provider);

  @override
  String get songId => (origin as DeleteCachedSongProvider).songId;
}

String _$downloadsPlayerHash() => r'822efcb3b3d4e70feada165a495de15ff3b28cdf';

/// Play cached songs from the downloads screen.
///
/// Copied from [DownloadsPlayer].
@ProviderFor(DownloadsPlayer)
final downloadsPlayerProvider =
    AutoDisposeNotifierProvider<DownloadsPlayer, void>.internal(
      DownloadsPlayer.new,
      name: r'downloadsPlayerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$downloadsPlayerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DownloadsPlayer = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
