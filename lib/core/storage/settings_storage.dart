import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_storage.g.dart';

const _keyServerUrl = 'server_url';
const _keyUsername = 'username';
const _keyPassword = 'password';

class SettingsStorage {
  const SettingsStorage(this._storage);

  final FlutterSecureStorage _storage;

  Future<String?> getServerUrl() => _storage.read(key: _keyServerUrl);
  Future<String?> getUsername() => _storage.read(key: _keyUsername);
  Future<String?> getPassword() => _storage.read(key: _keyPassword);

  Future<void> saveServerUrl(String url) =>
      _storage.write(key: _keyServerUrl, value: url);
  Future<void> saveUsername(String username) =>
      _storage.write(key: _keyUsername, value: username);
  Future<void> savePassword(String password) =>
      _storage.write(key: _keyPassword, value: password);

  Future<ServerCredentials?> getCredentials() async {
    final url = await getServerUrl();
    final username = await getUsername();
    final password = await getPassword();
    if (url == null || username == null || password == null) return null;
    return ServerCredentials(serverUrl: url, username: username, password: password);
  }

  Future<void> saveCredentials(ServerCredentials creds) async {
    await saveServerUrl(creds.serverUrl);
    await saveUsername(creds.username);
    await savePassword(creds.password);
  }
}

class ServerCredentials {
  const ServerCredentials({
    required this.serverUrl,
    required this.username,
    required this.password,
  });

  final String serverUrl;
  final String username;
  final String password;
}

@riverpod
SettingsStorage settingsStorage(SettingsStorageRef ref) {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  return SettingsStorage(storage);
}

@riverpod
Future<ServerCredentials?> serverCredentials(ServerCredentialsRef ref) {
  final storage = ref.watch(settingsStorageProvider);
  return storage.getCredentials();
}
