import 'package:shared_preferences/shared_preferences.dart';

class SaveIsChangeCollors {
  static const _keyIndex = 'currentBackgroundIndex';

  static Future<int> loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyIndex) ?? 3;
  }

  static Future<void> saveIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyIndex, index);
  }
}
