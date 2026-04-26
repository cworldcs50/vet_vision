import 'package:get/get.dart';
import 'controller/home/home_controller.dart';
import 'controller/logo/logo_controller.dart';
import 'controller/auth/auth_controller.dart';
import 'controller/payment/payment_controller.dart';
import 'controller/profile/profile_controller.dart';
import 'controller/bookings/bookings_controller.dart';
import 'controller/messages/messages_controller.dart';
import 'controller/book_appointment/checkout_controller.dart';
import 'controller/book_appointment/book_appointment_controller.dart';
import 'controller/on_boarding_controller/on_boarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoController());

    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => BookAppointmentController());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => BookingsController(), fenix: true);
    Get.lazyPut(() => MessagesController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
  }
}
