import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<void> init() async {}

  static setString(String key, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value!);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }
}
