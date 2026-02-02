import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../core/services/app_service.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/constants/caching_keys_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/datasource/static/on_boarding_data.dart';

class OnBoardingController extends GetxController {
  int currentPageIndex = 0;
  late final PageController pageController;
  late final SharedPreferences _sharedPrefs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    _sharedPrefs = Get.find<AppServices>().appSharedPrefs;
  }

  Future<void> skip() async {
    await _sharedPrefs.setBool(CachingKeysConstants.kVisited, true);
    await Get.offAllNamed(AppRoutesName.rSignIn);
  }

  Future<void> next() async {
    // If we're on the last page, mark visited and navigate away and do not
    // attempt to animate the page controller (the PageView will be disposed
    // during navigation which causes the ScrollController assertion).
    if (currentPageIndex == kOnBoardingData.length - 1) {
      log("Current page index: $currentPageIndex");
      log("on boarding models length: ${kOnBoardingData.length - 1}");
      await skip();
      return;
    }

    // Only animate if the controller is attached to at least one PageView.
    if (pageController.hasClients) {
      await pageController.animateToPage(
        currentPageIndex + 1,
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 1200),
      );
    }

    update();
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
