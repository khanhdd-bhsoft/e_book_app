import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/string_constants.dart';

class ThemesDataSource {
  Future<void> changeTheme(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(StringConstants.themesKey, value);
  }

  Future<bool?> getTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(StringConstants.themesKey);
  }
}
