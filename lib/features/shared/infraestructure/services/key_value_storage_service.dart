abstract class KeyValueStorageService {
  Future<void> setKeyValue<T>(String Key, T value);
  Future<T?> getValue<T>(String Key);
  Future<bool> removeKey(String Key);
}
