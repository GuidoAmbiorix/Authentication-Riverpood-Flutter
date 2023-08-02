import 'package:shared_preferences/shared_preferences.dart';
import 'package:teslo_shop/features/shared/infraestructure/services/key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String Key) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case int:
        return prefs.getInt(Key) as T?;

      case String:
        return prefs.getString(Key) as T?;

      default:
        throw UnimplementedError(
            'Get not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String Key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(Key);
  }

  @override
  Future<void> setKeyValue<T>(String Key, T value) async {
    final prefs = await getSharedPrefs();
    switch (T) {
      case int:
        prefs.setInt(Key, value as int);
        break;

      case String:
        prefs.setString(Key, value as String);
        break;

      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }
}
