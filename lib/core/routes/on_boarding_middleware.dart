import 'package:get/get.dart';
import 'app_routes_name.dart';
import 'package:flutter/widgets.dart';
import '../services/app_service.dart';
import '../constants/caching_keys_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingMiddleware extends GetMiddleware {
  final SharedPreferences _sharedPrefs = Get.find<AppServices>().appSharedPrefs;

  @override
  RouteSettings? redirect(String? route) {
    if (_sharedPrefs.getBool(CachingKeysConstants.kVisited) == true) {
      return const RouteSettings(name: AppRoutesName.rSignIn);
    }
    return null;
  }
}
