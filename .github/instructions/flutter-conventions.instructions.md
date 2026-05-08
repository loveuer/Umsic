---
applyTo: "lib/**/*.dart"
description: "Flutter Dart conventions for the Umsic project"
---

# Flutter / Dart Conventions

## Code Generation
Always run after adding/modifying `@freezed`, `@riverpod`, or `@JsonSerializable` classes:
```bash
dart run build_runner build --delete-conflicting-outputs
```

## Models (freezed + json_serializable)
```dart
@freezed
class Album with _$Album {
  const factory Album({
    required String id,
    required String name,
    String? coverArt,
    // ...
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
```
- Generated files (`*.freezed.dart`, `*.g.dart`) are committed to VCS — do NOT gitignore them.

## Riverpod Providers
```dart
@riverpod
Future<List<Album>> albums(AlbumsRef ref) async {
  final client = ref.watch(navidromeClientProvider);
  return client.getAlbums();
}
```
- Use `ref.invalidate()` to force refresh, not `ref.refresh()` in UI.
- Keep providers close to the feature that owns them.

## API Client Pattern
```dart
// Throw on non-ok status, never return nulls for required data
Future<T> _request<T>(String endpoint, Map<String, String> params) async {
  final response = await _dio.get(endpoint, queryParameters: {..._authParams, ...params});
  final body = SubsonicResponse.fromJson(response.data);
  if (body.status != 'ok') throw SubsonicException(body.error!);
  return body.data as T;
}
```

## Widget Structure
- Prefer `ConsumerWidget` over `StatelessWidget` when accessing providers.
- Use `ConsumerStatefulWidget` only when local widget state is also needed.
- Extract reusable widgets to `lib/shared/widgets/`.
