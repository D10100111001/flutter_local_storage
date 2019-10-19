import 'package:flutter_local_storage/storage_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider implements StorageProvider {
  @override
  Future<String> getVal(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future setVal(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }
}
