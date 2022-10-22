import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {


  static SharedPreferences? _sharePreferences;



  Future<SharedPreferences> getInstance() async {
    return _sharePreferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> setValueTypeBool(String key,bool value) async {
    await _sharePreferences?.setBool(key, value);
  }

  static  Future<bool> getValue(String key) async {
    return  _sharePreferences?.getBool(key)?? false;
  }
}
