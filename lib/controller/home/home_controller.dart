import 'package:get/get.dart';
import '../../core/routes/app_routes_name.dart';

class HomeController extends GetxController {
  Future<void> goToBookAppointement() async =>
      await Get.toNamed(AppRoutesName.rBookAppointment);

  Future<void> goToHealthRecords() async =>
      await Get.toNamed(AppRoutesName.rHealthRecords);

  Future<void> goToMyPets() async => await Get.toNamed(AppRoutesName.rMyPets);
}
