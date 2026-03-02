import 'package:get/get.dart';
import '../../view/book_appointment/widgets/mobile_checkout.dart';
import 'app_routes_name.dart';
import 'auth_middleware.dart';
import '../../view/home/home.dart';
import '../../view/splash/logo.dart';
import 'on_boarding_middleware.dart';
import '../../view/auth/sign_in.dart';
import '../../view/auth/sign_up.dart';
import '../../view/my_pets/my_pets.dart';
import '../../view/auth/forget_password.dart';
import '../../view/auth/success_sign_in.dart';
import '../../view/onboarding/onboarding_view.dart';
import '../../view/health_records/health_records.dart';
import '../../view/book_appointment/doctor_details.dart';
import '../../view/book_appointment/book_appointment.dart';

List<GetPage> kAppPages = [
  GetPage(
    page: () => const Logo(),
    name: AppRoutesName.rLogo,
    middlewares: [OnBoardingMiddleware()],
  ),
  GetPage(
    page: () => const SignUp(),
    name: AppRoutesName.rSignUp,
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    page: () => const SignIn(),
    name: AppRoutesName.rSignIn,
    middlewares: [AuthMiddleware()],
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
    page: () => const DoctorDetails(),
    name: AppRoutesName.rDoctorDetails,
  ),
  GetPage(name: AppRoutesName.rCheckout, page: () => const Checkout()),
];
