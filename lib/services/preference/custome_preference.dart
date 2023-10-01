import 'package:shared_preferences/shared_preferences.dart';

/// ローカルストレージの共通クラス
class CustomSharedPreferences {
  /// String型をset
  Future<void> setString({required String key, required String value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }

  /// String型をget
  Future<String> getString({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getString(key);
    if (value == null) {
      return '';
    }
    return value;
  }
}
