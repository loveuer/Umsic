// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageCacheManagerHash() => r'eea4915fe2983253f88b504466d0fcee817c91d7';

/// See also [imageCacheManager].
@ProviderFor(imageCacheManager)
final imageCacheManagerProvider = Provider<MusicImageCacheManager>.internal(
  imageCacheManager,
  name: r'imageCacheManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageCacheManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImageCacheManagerRef = ProviderRef<MusicImageCacheManager>;
String _$cacheUsageBytesHash() => r'ed423cb080d34db7d7b0584191cd62c12b6c7f00';

/// See also [cacheUsageBytes].
@ProviderFor(cacheUsageBytes)
final cacheUsageBytesProvider = AutoDisposeFutureProvider<int>.internal(
  cacheUsageBytes,
  name: r'cacheUsageBytesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cacheUsageBytesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CacheUsageBytesRef = AutoDisposeFutureProviderRef<int>;
String _$cacheMaxSizeMbHash() => r'dffe905ab775db41d774fe88570b3672d7d1a356';

/// See also [CacheMaxSizeMb].
@ProviderFor(CacheMaxSizeMb)
final cacheMaxSizeMbProvider =
    AutoDisposeAsyncNotifierProvider<CacheMaxSizeMb, int>.internal(
      CacheMaxSizeMb.new,
      name: r'cacheMaxSizeMbProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cacheMaxSizeMbHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CacheMaxSizeMb = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
