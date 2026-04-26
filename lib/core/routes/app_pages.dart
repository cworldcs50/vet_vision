import 'package:get/get.dart';
import 'app_routes_name.dart';
import 'auth_middleware.dart';
import '../../view/home/home.dart';
import 'on_boarding_middleware.dart';
import '../../view/splash/logo.dart';
import '../../view/auth/auth_view.dart';
import '../../view/my_pets/my_pets.dart';
import '../../view/auth/role_selection.dart';
import '../../view/auth/forget_password.dart';
import '../../view/payment/payment_view.dart';
import '../../view/auth/success_sign_in.dart';
import '../../view/book_appointment/checkout.dart';
import '../../view/onboarding/onboarding_view.dart';
import '../../view/health_records/health_records.dart';
import '../../view/book_appointment/doctor_profile.dart';
import '../../view/book_appointment/book_appointment.dart';
import '../../view/doctor_view/doctor_login_view.dart';
import '../../view/doctor_view/doctor_registration_view.dart';
import '../../view/doctor_view/portal/doctor_portal_main_view.dart';

List<GetPage> kAppPages = [
  GetPage(
    name: AppRoutesName.rRoleSelection,
    page: () => const RoleSelection(),
  ),
  GetPage(
    name: AppRoutesName.rAuthView,
    page: () => const AuthView(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    page: () => const Logo(),
    name: AppRoutesName.rLogo,
    middlewares: [OnBoardingMiddleware()],
  ),
  GetPage(name: AppRoutesName.rHome, page: () => const HomeView()),
  GetPage(name: AppRoutesName.rOnBoarding, page: () => const OnboardingView()),
  GetPage(name: AppRoutesName.rSuccessAuth, page: () => const SuccessSignIn()),
  GetPage(
    page: () => const ForgetPassword(),
    name: AppRoutesName.rForgetPassword,
  ),
  GetPage(
    page: () => const BookAppointment(),
    name: AppRoutesName.rBookAppointment,
  ),
  GetPage(name: AppRoutesName.rMyPets, page: () => const MyPets()),
  GetPage(
    page: () => const HealthRecords(),
    name: AppRoutesName.rHealthRecords,
  ),
  GetPage(
    page: () => const DoctorProfile(),
    name: AppRoutesName.rDoctorDetails,
  ),
  GetPage(name: AppRoutesName.rCheckout, page: () => const Checkout()),
  GetPage(name: AppRoutesName.rPayment, page: () => const PaymentView()),
  GetPage(
    name: AppRoutesName.rDoctorSignIn,
    page: () => const DoctorLoginView(),
  ),
  GetPage(
    name: AppRoutesName.rDoctorSignUp,
    page: () => const DoctorRegistrationView(),
  ),
  GetPage(
    name: AppRoutesName.rDoctorPortal,
    page: () => const DoctorPortalMainView(),
  ),
];
