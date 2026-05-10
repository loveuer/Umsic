import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api/navidrome_client.dart';
import '../../core/database/database_provider.dart';
import '../../core/storage/cache_manager.dart';
import '../../core/storage/settings_storage.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _urlController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  bool _loading = false;
  bool _obscurePassword = true;
  String? _error;

  // Cache size (in GB, 1-20; null = not yet loaded)
  int? _cacheSizeGb;
  bool _clearingCache = false;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _loadSaved();
    _loadCacheSize();
  }

  Future<void> _loadSaved() async {
    final storage = ref.read(settingsStorageProvider);
    final creds = await storage.getCredentials();
    if (creds != null && mounted) {
      setState(() {
        _urlController.text = creds.serverUrl;
        _usernameController.text = creds.username;
        _passwordController.text = creds.password;
      });
    }
  }

  Future<void> _loadCacheSize() async {
    final mb = await ref.read(cacheMaxSizeMbProvider.future);
    if (mounted) {
      setState(() => _cacheSizeGb = (mb / 1024).round().clamp(1, 20));
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final url = _urlController.text.trim().replaceAll(RegExp(r'/$'), '');
      final username = _usernameController.text.trim();
      final password = _passwordController.text;

      // Test connection first
      final client = NavidromeClient(
        serverUrl: url,
        username: username,
        password: password,
      );
      await client.ping();

      // Save credentials
      final storage = ref.read(settingsStorageProvider);
      await storage.saveCredentials(
        ServerCredentials(
          serverUrl: url,
          username: username,
          password: password,
        ),
      );

      // Invalidate client so it reloads with new credentials
      ref.invalidate(navidromeClientProvider);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('连接成功，设置已保存')));
        context.go('/songs');
      }
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _onCacheSizeChanged(int gb) async {
    setState(() => _cacheSizeGb = gb);
    await ref.read(cacheMaxSizeMbProvider.notifier).setSizeMb(gb * 1024);
  }

  Future<void> _clearCache() async {
    setState(() => _clearingCache = true);
    try {
      final imageMgr = ref.read(imageCacheManagerProvider);
      await imageMgr.emptyCache();
      final tempDir = await getTemporaryDirectory();
      // Clear image cache files
      final imageDir = Directory(
        '${tempDir.path}/${MusicImageCacheManager.cacheKey}',
      );
      if (await imageDir.exists()) await imageDir.delete(recursive: true);
      // Clear audio cache files.
      final audioDir = Directory('${tempDir.path}/audio_cache');
      if (await audioDir.exists()) await audioDir.delete(recursive: true);
      // Clear cache metadata in database
      final db = ref.read(appDatabaseProvider);
      await db.deleteAll();
      ref.invalidate(cacheUsageBytesProvider);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('缓存已清除')));
      }
    } finally {
      if (mounted) setState(() => _clearingCache = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Server settings ──────────────────────────────────────────
            Text(
              '服务器',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: '服务器地址',
                      hintText: 'http://192.168.1.1:4533',
                      prefixIcon: Icon(Icons.dns),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                    autocorrect: false,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return '请输入服务器地址';
                      if (!v.trim().startsWith('http')) {
                        return '地址需以 http:// 或 https:// 开头';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: '用户名',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    autocorrect: false,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? '请输入用户名' : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: '密码',
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: (v) => v == null || v.isEmpty ? '请输入密码' : null,
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      _error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: _loading ? null : _save,
                    icon: _loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.check),
                    label: const Text('保存并连接'),
                  ),
                ],
              ),
            ),

            // ── Cache settings ───────────────────────────────────────────
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              '缓存',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Max cache size slider
            Row(
              children: [
                const Icon(Icons.storage_outlined, size: 20),
                const SizedBox(width: 8),
                const Text('最大缓存'),
                const Spacer(),
                Text(
                  _cacheSizeGb != null ? '$_cacheSizeGb GB' : '…',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Slider(
              value: (_cacheSizeGb ?? kDefaultCacheMaxSizeMb ~/ 1024)
                  .toDouble(),
              min: 1,
              max: 20,
              divisions: 19,
              label: '${_cacheSizeGb ?? ''} GB',
              onChanged: _cacheSizeGb == null
                  ? null
                  : (v) => setState(() => _cacheSizeGb = v.round()),
              onChangeEnd: _cacheSizeGb == null
                  ? null
                  : (v) => _onCacheSizeChanged(v.round()),
            ),
            Text(
              '超出缓存上限时将自动删除最旧的缓存',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            // Current cache usage
            const SizedBox(height: 16),
            Consumer(
              builder: (context, ref, _) {
                final usageAsync = ref.watch(cacheUsageBytesProvider);
                return Row(
                  children: [
                    const Icon(Icons.folder_outlined, size: 20),
                    const SizedBox(width: 8),
                    const Text('当前缓存'),
                    const Spacer(),
                    usageAsync.when(
                      loading: () => const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (e, s) => const Text('—'),
                      data: (bytes) => Text(
                        _formatBytes(bytes),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                );
              },
            ),

            // Clear cache button
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _clearingCache ? null : _clearCache,
              icon: _clearingCache
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.delete_outline),
              label: const Text('清除缓存'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }
}
