# mUsic — Flutter Music Client for Navidrome

A Flutter music client app connecting to a self-hosted [Navidrome](https://www.navidrome.org/) server via the [OpenSubsonic API](https://opensubsonic.netlify.app/docs/).

## Architecture

```
lib/
├── main.dart                  # App entry point, provider setup
├── app/
│   ├── router.dart            # go_router route definitions
│   └── theme.dart             # Material 3 theme
├── core/
│   ├── api/                   # Navidrome/OpenSubsonic API client
│   │   ├── navidrome_client.dart
│   │   └── models/            # JSON-serializable API response models
│   ├── audio/                 # just_audio + audio_service integration
│   │   ├── audio_handler.dart # Background audio handler
│   │   └── player_controller.dart
│   └── storage/               # Local persistence (Isar or drift)
├── features/                  # Feature-first structure
│   ├── songs/                 # Songs tab — song list, sort, filter
│   ├── artists/               # Artists tab — artist list + detail
│   ├── albums/                # Albums tab — album list + detail
│   ├── playlists/             # Playlists tab — list + detail (incl. Starred)
│   ├── player/                # Now playing screen + mini player
│   └── settings/              # Server URL, credentials, offline mode
└── shared/
    ├── widgets/               # Reusable UI components
    └── utils/
```

## State Management

Use **Riverpod** (`flutter_riverpod` + `riverpod_annotation`) throughout:
- `@riverpod` code generation for providers
- `AsyncNotifier` for data-fetching providers
- `Notifier` for pure state (e.g., player queue)
- Run `dart run build_runner watch` for code generation

## Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` + `riverpod_annotation` | State management |
| `go_router` | Navigation |
| `dio` | HTTP client for Navidrome API |
| `just_audio` | Audio playback |
| `audio_service` | Background playback + media notifications |
| `cached_network_image` | Album art caching |
| `isar` | Local database (offline cache) |
| `freezed` + `json_serializable` | Immutable models + JSON serialization |

## Navidrome / OpenSubsonic API

**Base URL**: `{serverUrl}/rest/{endpoint}`

**Authentication** — append to every request:
```
u={username}&t={md5(password+salt)}&s={salt}&v=1.16.1&c=mUsic&f=json
```
- `t` = MD5 of `password + salt` (NOT the raw password)
- `c` = client name (`mUsic`)
- `f=json` always

**Common endpoints**:
| Endpoint | Description |
|---|---|
| `ping` | Check server connectivity |
| `getArtists` | Get all artists (index) |
| `getArtist?id=` | Artist detail + albums |
| `getAlbum?id=` | Album detail + songs |
| `getSong?id=` | Single song metadata |
| `getPlaylists` | List playlists |
| `getPlaylist?id=` | Playlist detail + entries |
| `stream?id=&maxBitRate=` | Stream audio (use as audio URL) |
| `getCoverArt?id=&size=` | Fetch cover art image |
| `scrobble?id=&time=` | Report playback (Last.fm scrobble) |
| `search3?query=` | Search artists/albums/songs |
| `getStarred2` | Get starred/favorited items |
| `star?id=` / `unstar?id=` | Star/unstar an item |

All responses wrap in `subsonic-response` → check `.status == "ok"` before reading data.

**Stream URL** is used directly as a URI in `just_audio` — include auth params in the URL.

## Build & Test

```bash
# Install deps
flutter pub get

# Code generation (freezed, riverpod, json_serializable)
dart run build_runner build --delete-conflicting-outputs

# Run on device/emulator
flutter run

# Tests
flutter test

# Analyze
flutter analyze
```

## Conventions

- **Models**: Use `@freezed` + `@JsonSerializable()`. Run build_runner after changes.
- **Providers**: Annotate with `@riverpod`, keep in same file as the feature or in `feature/providers/`.
- **Error handling**: API errors return a `SubsonicError` model; throw typed exceptions from the API client layer, handle in UI with `AsyncValue.error`.
- **Cover art**: Always use `getCoverArt` endpoint with `size=` param (e.g., `300` for list, `600` for detail). Cache via `cached_network_image`.
- **Audio streaming**: Construct the stream URL with auth params and pass to `just_audio`; do NOT download the file first.
- **Offline mode**: Cache metadata in Isar; mark items as "available offline" when downloaded.
- **No hardcoded server URL**: Always read from user settings/secure storage.

## Features

Main navigation uses a **bottom tab bar** with four tabs:

| Tab | Description |
|---|---|
| 歌曲 (Songs) | All songs list; supports sort/filter |
| 歌手 (Artists) | Artist list → artist detail → album list |
| 专辑 (Albums) | Album grid/list → album detail + tracklist |
| 歌单 (Playlists) | Playlist list + detail; **"我的最爱"** is a virtual playlist backed by `getStarred2` (not a real Navidrome playlist) |

**"我的最爱" implementation**: fetch via `getStarred2`, display as a regular playlist. Star/unstar songs via `star?id=` / `unstar?id=`.

## Platform Targets

| Platform | Priority | Notes |
|---|---|---|
| Android Mobile | **MVP** | Primary development target |
| Android Pad | Planned | Adaptive layout (two-pane where space allows) |
| Android TV | Planned | D-pad navigation, Leanback-style UI |
| Web | Planned | Same codebase via `flutter build web` |

- **MVP = Android Mobile only.** Do not add pad/TV/web-specific code until MVP is complete.
- Adaptive layout: use `LayoutBuilder` / `MediaQuery` breakpoints — don't create separate widget trees per platform.
- Background audio on Android: `audio_service` requires `AndroidManifest.xml` configuration — see package README.
