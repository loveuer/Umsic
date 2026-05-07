---
name: navidrome-api
description: >
  Use when adding a new Navidrome/OpenSubsonic API endpoint, implementing a new feature
  that calls the server, or debugging API authentication and response parsing.
---

# Add Navidrome API Endpoint

Implement a new OpenSubsonic API call in the mUsic client.

## Steps

### 1. Add the method to `NavidromeClient`
In `lib/core/api/navidrome_client.dart`:
```dart
Future<List<SomeModel>> getSomething({String? param}) async {
  final data = await _request('getSomething', {
    if (param != null) 'paramName': param,
  });
  return (data['items'] as List)
      .map((e) => SomeModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
```

### 2. Create or update the response model
In `lib/core/api/models/`:
```dart
@freezed
class SomeModel with _$SomeModel {
  const factory SomeModel({
    required String id,
    required String name,
    // map OpenSubsonic JSON field names exactly (camelCase)
  }) = _SomeModel;

  factory SomeModel.fromJson(Map<String, dynamic> json) =>
      _$SomeModelFromJson(json);
}
```
Run `dart run build_runner build --delete-conflicting-outputs`.

### 3. Create a Riverpod provider
```dart
@riverpod
Future<List<SomeModel>> something(SomethingRef ref, {String? param}) async {
  final client = ref.watch(navidromeClientProvider);
  return client.getSomething(param: param);
}
```

### 4. Use in UI
```dart
class SomeWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(somethingProvider());
    return asyncValue.when(
      data: (items) => ListView(...),
      loading: () => const CircularProgressIndicator(),
      error: (e, _) => ErrorWidget(e.toString()),
    );
  }
}
```

## Authentication Reference
Every request automatically includes auth params via `_authParams`:
- `u`, `t` (MD5 token), `s` (salt), `v=1.16.1`, `c=mUsic`, `f=json`

## OpenSubsonic Docs
- Full API reference: https://opensubsonic.netlify.app/docs/endpoints/
- Navidrome-specific extensions: https://www.navidrome.org/docs/developers/subsonic-api/
