import 'package:get/get.dart';
import '../../core/routes/app_routes_name.dart';

class RoleSelectionController extends GetxController {
  void selectRole(bool isDoctor) {
    if (isDoctor) {
      Get.toNamed(AppRoutesName.rDoctorSignIn);
    } else {
      Get.toNamed(AppRoutesName.rAuthView, arguments: {'isDoctor': false});
    }
  }
}
