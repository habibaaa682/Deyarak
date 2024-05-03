import 'package:shared_preferences/shared_preferences.dart';

class GlobalSharedPreferences {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs;

  static String getString(String key) {
   print(_prefs.getString(key));
    return _prefs.getString(key) ?? "";
  }

  // Example method to set a preference value
  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }
}