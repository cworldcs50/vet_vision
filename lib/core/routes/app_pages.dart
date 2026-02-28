import 'package:get/get.dart';
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
    name: AppRoutesName.rSignUp,
    page: () => const SignUp(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(
    name: AppRoutesName.rSignIn,
    page: () => const SignIn(),
    middlewares: [AuthMiddleware()],
  ),
  GetPage(name: AppRoutesName.rHome, page: () => const HomeView()),
  GetPage(name: AppRoutesName.rOnBoarding, page: () => const OnboardingView()),
  GetPage(name: AppRoutesName.rSuccessAuth, page: () => const SuccessSignIn()),
  GetPage(
    name: AppRoutesName.rForgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoutesName.rBookAppointment,
    page: () => const BookAppointment(),
  ),
  GetPage(name: AppRoutesName.rMyPets, page: () => const MyPets()),
  GetPage(
    name: AppRoutesName.rHealthRecords,
    page: () => const HealthRecords(),
  ),
  GetPage(
    name: AppRoutesName.rDoctorDetails,
    page: () => const DoctorDetails(),
  ),
];
