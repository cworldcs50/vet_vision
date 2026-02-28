import 'package:get/get.dart';
import 'controller/home/home_controller.dart';
import 'controller/logo/logo_controller.dart';
import 'controller/auth/sign_in_controller.dart';
import 'controller/auth/sign_up_controller.dart';
import 'controller/on_boarding_controller/on_boarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoController());
    Get.lazyPut(() => OnBoardingController());
    Get.put(SignInController());
    Get.put(SignUpController());
    Get.lazyPut(() => HomeController());
  }
}
