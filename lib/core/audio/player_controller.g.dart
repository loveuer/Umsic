// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioHandlerHash() => r'703b04259204a56af975e29e26c506d8b2955292';

/// See also [audioHandler].
@ProviderFor(audioHandler)
final audioHandlerProvider = Provider<MusicAudioHandler>.internal(
  audioHandler,
  name: r'audioHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AudioHandlerRef = ProviderRef<MusicAudioHandler>;
String _$isSongCachedHash() => r'61518295bce5d15c58b672ed5250053922fdf6e4';

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

/// Whether a song is currently cached locally — watches DB reactively.
///
/// Copied from [isSongCached].
@ProviderFor(isSongCached)
const isSongCachedProvider = IsSongCachedFamily();

/// Whether a song is currently cached locally — watches DB reactively.
///
/// Copied from [isSongCached].
class IsSongCachedFamily extends Family<AsyncValue<bool>> {
  /// Whether a song is currently cached locally — watches DB reactively.
  ///
  /// Copied from [isSongCached].
  const IsSongCachedFamily();

  /// Whether a song is currently cached locally — watches DB reactively.
  ///
  /// Copied from [isSongCached].
  IsSongCachedProvider call(String songId) {
    return IsSongCachedProvider(songId);
  }

  @override
  IsSongCachedProvider getProviderOverride(
    covariant IsSongCachedProvider provider,
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
  String? get name => r'isSongCachedProvider';
}

/// Whether a song is currently cached locally — watches DB reactively.
///
/// Copied from [isSongCached].
class IsSongCachedProvider extends AutoDisposeStreamProvider<bool> {
  /// Whether a song is currently cached locally — watches DB reactively.
  ///
  /// Copied from [isSongCached].
  IsSongCachedProvider(String songId)
    : this._internal(
        (ref) => isSongCached(ref as IsSongCachedRef, songId),
        from: isSongCachedProvider,
        name: r'isSongCachedProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isSongCachedHash,
        dependencies: IsSongCachedFamily._dependencies,
        allTransitiveDependencies:
            IsSongCachedFamily._allTransitiveDependencies,
        songId: songId,
      );

  IsSongCachedProvider._internal(
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
    Stream<bool> Function(IsSongCachedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsSongCachedProvider._internal(
        (ref) => create(ref as IsSongCachedRef),
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
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _IsSongCachedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsSongCachedProvider && other.songId == songId;
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
mixin IsSongCachedRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `songId` of this provider.
  String get songId;
}

class _IsSongCachedProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with IsSongCachedRef {
  _IsSongCachedProviderElement(super.provider);

  @override
  String get songId => (origin as IsSongCachedProvider).songId;
}

String _$songLyricsHash() => r'880a0b3cfae2cc443d7d27d094565fab738c2f2f';

/// Current song's lyrics
///
/// Copied from [songLyrics].
@ProviderFor(songLyrics)
final songLyricsProvider =
    AutoDisposeFutureProvider<List<StructuredLyrics>>.internal(
      songLyrics,
      name: r'songLyricsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$songLyricsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SongLyricsRef = AutoDisposeFutureProviderRef<List<StructuredLyrics>>;
String _$playerQueueHash() => r'0e137fcd1ee23503e59caf1c09ef791e0b40d0f3';

/// Current playback queue (Song objects)
///
/// Copied from [PlayerQueue].
@ProviderFor(PlayerQueue)
final playerQueueProvider = NotifierProvider<PlayerQueue, List<Song>>.internal(
  PlayerQueue.new,
  name: r'playerQueueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerQueueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerQueue = Notifier<List<Song>>;
String _$currentIndexHash() => r'3b3d9926082f4b123a1d061679cf71094b517247';

/// Current index in queue — auto-synced from the player's currentIndexStream.
///
/// Copied from [CurrentIndex].
@ProviderFor(CurrentIndex)
final currentIndexProvider = NotifierProvider<CurrentIndex, int>.internal(
  CurrentIndex.new,
  name: r'currentIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentIndex = Notifier<int>;
String _$playModeNotifierHash() => r'ecdf344db6bdbc9daeb8282a5640a01514409ffb';

/// Play mode — sequence / loop / shuffle
///
/// Copied from [PlayModeNotifier].
@ProviderFor(PlayModeNotifier)
final playModeNotifierProvider =
    NotifierProvider<PlayModeNotifier, PlayMode>.internal(
      PlayModeNotifier.new,
      name: r'playModeNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$playModeNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PlayModeNotifier = Notifier<PlayMode>;
String _$playerControllerHash() => r'd692abb31db0d0fd1443177640d631122ba263a2';

/// Helper provider to play a list of songs starting at index
///
/// Copied from [PlayerController].
@ProviderFor(PlayerController)
final playerControllerProvider =
    AutoDisposeNotifierProvider<PlayerController, void>.internal(
      PlayerController.new,
      name: r'playerControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$playerControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PlayerController = AutoDisposeNotifier<void>;
String _$downloadManagerHash() => r'0352b6ecffafe2c571942069cc853ee42317203a';

/// Download manager — keepAlive so downloads survive navigation.
///
/// Copied from [DownloadManager].
@ProviderFor(DownloadManager)
final downloadManagerProvider =
    NotifierProvider<DownloadManager, void>.internal(
      DownloadManager.new,
      name: r'downloadManagerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$downloadManagerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DownloadManager = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
