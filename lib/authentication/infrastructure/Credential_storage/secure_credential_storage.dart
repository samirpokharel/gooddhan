import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './credential_storage.dart';

class SecureCredentialStorage implements CredentialStorage {
  final FlutterSecureStorage _storage;

  SecureCredentialStorage(this._storage);

  static const String _key = "auth_credentials";

  String? _credential;

  @override
  Future<String?> read() async {
    if (_credential != null) return _credential;
    _credential = await _storage.read(key: _key);
    return _credential;
  }

  @override
  Future<void> save(String credential) {
    _credential = credential;
    return _storage.write(key: _key, value: credential);
  }

  @override
  Future<void> clear() {
    _credential = null;
    return _storage.delete(key: _key);
  }
}
