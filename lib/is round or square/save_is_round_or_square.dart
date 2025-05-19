import 'package:shared_preferences/shared_preferences.dart';

class SaveIsRoundOrSquare {
  static const _key = 'isToggleRoundOrSquare';

  static Future<bool> loadFormat() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? true;
  }

  static Future<void> saveFormat(bool is24Hour) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, is24Hour);
  }
}
