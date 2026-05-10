// ignore_for_file: experimental_member_use

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:just_audio/just_audio.dart';

/// A [StreamAudioSource] that downloads audio from a URI exactly once,
/// caching it to a local file while serving byte-range requests to the player.
///
/// Unlike [LockCachingAudioSource], this source NEVER makes secondary HTTP
/// requests. If ExoPlayer requests bytes that haven't been downloaded yet,
/// it blocks and waits for the single download stream to reach them.
///
/// This guarantees a 1:1 traffic ratio (file size = bytes downloaded).
class SingleDownloadCachingAudioSource extends StreamAudioSource {
  final Uri uri;
  final Map<String, String>? headers;
  final Future<File> cacheFile;
  final VoidCallback? onComplete;

  // Download state
  int? _sourceLength;
  String? _contentType;
  bool _downloadComplete = false;
  int _downloadedBytes = 0;
  int _flushedBytes = 0;
  bool _downloadStarted = false;
  Completer<void>? _headersCompleter;
  Completer<void>? _downloadCompleter;
  final _downloadProgressController = StreamController<int>.broadcast();

  SingleDownloadCachingAudioSource(
    this.uri, {
    this.headers,
    File? cacheFile,
    this.onComplete,
    super.tag,
  }) : cacheFile = cacheFile != null
           ? Future.value(cacheFile)
           : _getDefaultCacheFile(uri);

  Future<File> get _partialCacheFile async =>
      File('${(await cacheFile).path}.part');

  Future<File> get _mimeFile async => File('${(await cacheFile).path}.mime');

  /// Stream that emits the current number of downloaded bytes.
  Stream<int> get downloadProgressStream => _downloadProgressController.stream;

  int get downloadedBytes => _downloadedBytes;
  bool get isDownloadComplete => _downloadComplete;

  static Future<File> _getDefaultCacheFile(Uri uri) async {
    final tempDir = await _getCacheDir();
    final hash = sha256.convert(utf8.encode(uri.toString())).toString();
    return File('${tempDir.path}/$hash');
  }

  static Future<Directory> _getCacheDir() async {
    final tempDir = Directory.systemTemp;
    final dir = Directory('${tempDir.path}/single_download_cache');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return dir;
  }

  // ─── Public API ────────────────────────────────────────────────────────

  /// Returns an [AudioSource] resolving to the cache file if it exists,
  /// otherwise returns `this`.
  Future<IndexedAudioSource> resolve() async {
    final file = await cacheFile;
    if (await file.exists()) {
      return AudioSource.uri(Uri.file(file.path));
    }
    return this;
  }

  Future<void> clearCache() async {
    if (_downloadStarted && !_downloadComplete) {
      throw Exception('Cannot clear cache while download is in progress');
    }
    final file = await cacheFile;
    if (await file.exists()) await file.delete();
    final partial = await _partialCacheFile;
    if (await partial.exists()) await partial.delete();
    final mime = await _mimeFile;
    if (await mime.exists()) await mime.delete();
    _downloadedBytes = 0;
    _flushedBytes = 0;
    _sourceLength = null;
    _contentType = null;
    _downloadComplete = false;
    _downloadStarted = false;
    _headersCompleter = null;
    _downloadCompleter = null;
  }

  // ─── Core: request() ─────────────────────────────────────────────────

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final finalFile = await cacheFile;

    // Fast path: file already fully downloaded
    if (await finalFile.exists()) {
      return _serveFromFile(finalFile, start, end);
    }

    // Start the single download (idempotent)
    _ensureDownloading();

    // Wait until we know the content length (HTTP response headers received)
    await _waitForSourceLength();

    return _serveFromGrowingCache(start, end);
  }

  // ─── Download Management ─────────────────────────────────────────────

  void _ensureDownloading() {
    if (_downloadStarted) return;
    _downloadStarted = true;
    _headersCompleter = Completer<void>();
    _downloadCompleter = Completer<void>();
    _download();
  }

  Future<void> _download() async {
    final partialFile = await _partialCacheFile;

    try {
      await partialFile.create(recursive: true);

      final client = _createHttpClient();
      final httpRequest = await _getUrl(client, uri, headers: headers);
      final response = await httpRequest.close();

      if (response.statusCode != 200) {
        client.close();
        throw Exception('HTTP ${response.statusCode}');
      }

      _sourceLength = response.contentLength == -1
          ? null
          : response.contentLength;
      _contentType = response.headers.contentType?.toString() ?? 'audio/mpeg';

      // Save MIME type for later retrieval
      final mimeFile = await _mimeFile;
      await mimeFile.writeAsString(_contentType!);
      _headersCompleter?.complete();

      final sink = partialFile.openWrite();
      int total = 0;
      int lastFlush = 0;

      await for (final chunk in response) {
        total += chunk.length;
        sink.add(chunk);
        _downloadedBytes = total;
        if (total - lastFlush >= 256 * 1024) {
          await sink.flush();
          _flushedBytes = total;
          lastFlush = total;
        }
        _downloadProgressController.add(total);
      }

      await sink.flush();
      _flushedBytes = total;
      await sink.close();
      client.close();

      // Atomic rename: partial → final
      final finalFile = await cacheFile;
      await partialFile.rename(finalFile.path);

      _downloadComplete = true;
      onComplete?.call();
      if (!(_downloadCompleter?.isCompleted ?? true)) {
        _downloadCompleter?.complete();
      }
      // Close progress stream (may already be closed if error)
      if (!_downloadProgressController.isClosed) {
        _downloadProgressController.close();
      }
    } catch (e, st) {
      // Clean up partial file on failure
      try {
        final pf = await _partialCacheFile;
        if (await pf.exists()) await pf.delete();
      } catch (_) {}

      _downloadStarted = false;
      if (!(_headersCompleter?.isCompleted ?? true)) {
        _headersCompleter?.completeError(e, st);
      }
      if (!(_downloadCompleter?.isCompleted ?? true)) {
        _downloadCompleter?.completeError(e, st);
      }

      if (!_downloadProgressController.isClosed) {
        _downloadProgressController.addError(e, st);
      }
    }
  }

  // ─── Wait Helpers ────────────────────────────────────────────────────

  Future<void> _waitForSourceLength() async {
    if (_sourceLength != null) return;
    if (_downloadComplete) return;
    await _headersCompleter?.future;
  }

  Future<void> _waitForDownloadComplete() async {
    if (_downloadComplete) return;
    await _downloadCompleter?.future;
  }

  // ─── File Serving ────────────────────────────────────────────────────

  Future<StreamAudioResponse> _serveFromFile(
    File file,
    int? start,
    int? end,
  ) async {
    final fileLength = await file.length();
    final sourceLength = _sourceLength ?? fileLength;
    final effectiveStart = start ?? 0;
    // During an in-progress download, only serve bytes flushed to disk.
    final requestedEnd = end ?? fileLength;
    final effectiveEnd = requestedEnd < fileLength ? requestedEnd : fileLength;

    final contentType = await _getContentType();

    return StreamAudioResponse(
      rangeRequestsSupported: true,
      sourceLength: start != null ? sourceLength : null,
      contentLength: effectiveEnd - effectiveStart,
      offset: start,
      contentType: contentType,
      stream: file.openRead(effectiveStart, effectiveEnd).asBroadcastStream(),
    );
  }

  Future<StreamAudioResponse> _serveFromGrowingCache(
    int? start,
    int? end,
  ) async {
    final sourceLength = _sourceLength;
    final effectiveStart = start ?? 0;
    final contentLength = end != null
        ? end - effectiveStart
        : sourceLength != null
        ? sourceLength - effectiveStart
        : null;
    final contentType = await _getContentType();

    return StreamAudioResponse(
      rangeRequestsSupported: true,
      sourceLength: start != null ? sourceLength : null,
      contentLength: contentLength,
      offset: start,
      contentType: contentType,
      stream: _readGrowingCache(effectiveStart, end).asBroadcastStream(),
    );
  }

  Stream<List<int>> _readGrowingCache(int start, int? end) async* {
    var position = start;

    while (true) {
      final finalFile = await cacheFile;
      if (await finalFile.exists()) {
        if (end == null || position < end) {
          yield* finalFile.openRead(position, end);
        }
        return;
      }

      final partialFile = await _partialCacheFile;
      final available = _flushedBytes;
      if (position < available) {
        final readEnd = end != null && end < available ? end : available;
        yield* _openStableRange(partialFile, position, readEnd);
        position = readEnd;
        if (end != null && position >= end) {
          return;
        }
        continue;
      }

      if (_downloadComplete) {
        await _waitForDownloadComplete();
        continue;
      }

      await _waitForMoreBytes(position);
    }
  }

  Stream<List<int>> _openStableRange(File file, int start, int end) =>
      file.openRead(start, end);

  Future<void> _waitForMoreBytes(int position) async {
    if (_downloadedBytes > position || _downloadComplete) return;
    final downloadFuture = _downloadCompleter?.future;
    await Future.any([
      _downloadProgressController.stream.firstWhere(
        (bytes) => bytes > position,
      ),
      ?downloadFuture,
    ]);
  }

  Future<String> _getContentType() async {
    if (_contentType != null) return _contentType!;
    final mimeFile = await _mimeFile;
    if (await mimeFile.exists()) return await mimeFile.readAsString();
    return 'audio/mpeg';
  }
}

// ─── HTTP helpers (replicate just_audio's private _getUrl and _createHttpClient) ───

Future<HttpClientRequest> _getUrl(
  HttpClient client,
  Uri uri, {
  Map<String, String>? headers,
}) async {
  final request = await client.getUrl(uri);
  if (headers != null) {
    final host = request.headers.value(HttpHeaders.hostHeader);
    request.headers.clear();
    request.headers.set(HttpHeaders.contentLengthHeader, '0');
    headers.forEach((name, value) => request.headers.set(name, value));
    if (host != null) {
      request.headers.set(HttpHeaders.hostHeader, host);
    }
    if (client.userAgent != null) {
      request.headers.set(HttpHeaders.userAgentHeader, client.userAgent!);
    }
  }
  // Match ExoPlayer's native redirect behavior
  request.maxRedirects = 20;
  return request;
}

HttpClient _createHttpClient({String? userAgent}) {
  final client = HttpClient();
  if (userAgent != null) {
    client.userAgent = userAgent;
  }
  return client;
}
