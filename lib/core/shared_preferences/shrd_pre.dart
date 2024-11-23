import 'package:shared_preferences/shared_preferences.dart';

class ShrdPre {
  static late SharedPreferences prefs;

  static Future initShared() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool getTheme() {
    return prefs.getBool('isDark') ?? false;
  }

  static Future setTheme(bool isDark) async {
    await prefs.setBool('isDark', isDark);
  }
}
