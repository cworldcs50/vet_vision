import 'package:get/get.dart';
import 'app_routes_name.dart';
import '../../view/home/home.dart';
import '../../view/splash/logo.dart';
import 'on_boarding_middleware.dart';
import '../../view/auth/sign_in.dart';
import '../../view/auth/sign_up.dart';
import '../../view/auth/success_sign_in.dart';
import '../../view/onboarding/onboarding_view.dart';

List<GetPage> kAppPages = [
  GetPage(
    page: () => const Logo(),
    name: AppRoutesName.rLogo,
    middlewares: [OnBoardingMiddleware()],
  ),
  GetPage(name: AppRoutesName.rSignUp, page: () => const SignUp()),
  GetPage(name: AppRoutesName.rSignIn, page: () => const SignIn()),
  GetPage(name: AppRoutesName.rHome, page: () => const HomeView()),
  GetPage(name: AppRoutesName.rOnBoarding, page: () => const OnboardingView()),
  GetPage(name: AppRoutesName.rSuccessAuth, page: () => const SuccessSignIn()),
];
