import 'dart:convert';

import 'package:doclense/data/modals/login_modal.dart';
import 'package:doclense/preferences/preferences.dart';

class PreferencesHelper {
  static const String USER = 'user';

  static setUserDetails(LoginModal loginModal) async {
    await Preferences.setString(USER, jsonEncode(loginModal));
  }

  static Future<LoginModal?> getUserDetails() async {
    LoginModal? response;
    String data = await Preferences.getString(USER);
    if (data.isNotEmpty) {
      response = LoginModal.fromJson(json.decode(data));
    }
    return response;
  }
}
