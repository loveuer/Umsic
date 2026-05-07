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

/// Current index in queue
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
String _$playerControllerHash() => r'fa7c9f6277cfbed502d29a4d7cc9f42a16b68f47';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
