import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/string_constants.dart';

class OnBoardingDataSource {
  Future<void> setValue() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(StringConstants.onBoardingKey, true);
  }

  Future<bool?> getOnBoarding() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(StringConstants.onBoardingKey);
  }
}
