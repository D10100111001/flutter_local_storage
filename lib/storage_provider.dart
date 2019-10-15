abstract class StorageProvider {
  Future<String> getVal(String key);
  Future setVal(String key, String value);
}
