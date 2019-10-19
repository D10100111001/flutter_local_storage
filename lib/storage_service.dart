import 'package:flutter/foundation.dart';
import 'package:flutter_local_storage/local_storage_provider.dart';
import 'package:flutter_local_storage/shared_preferences_provider.dart';
import 'package:flutter_local_storage/storage_provider.dart';

class StorageService extends StorageProvider {
  StorageProvider _getProvider() {
    return kIsWeb ? LocalStorageProvider() : SharedPreferencesProvider();
  }

  @override
  Future<String> getVal(String key) async {
    return await _getProvider().getVal(key);
  }

  @override
  Future setVal(String key, String value) async {
    return _getProvider().setVal(key, value);
  }
}
