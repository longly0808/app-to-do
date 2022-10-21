import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static String statusLogin = 'ISLOGIN';
  late SharedPreferences? sharePreferences;



  Future<void> getInstance() async {
    sharePreferences = await SharedPreferences.getInstance();
  }

  Future<void> setStatusLogin(bool value) async {
    if (sharePreferences == null) {
      getInstance();
    }
    await sharePreferences?.setBool(statusLogin, value);
  }

  Future<bool?> getStatusLogin() async {
    if (sharePreferences == null) {
      getInstance();
    }
    return await sharePreferences?.getBool(statusLogin);
  }
}
