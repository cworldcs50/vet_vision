import 'package:get/get.dart';
import 'widgets/mobile_auth_view.dart';
import 'package:flutter/material.dart';
import 'widgets/desktop_auth_view.dart';
import 'widgets/tablet_auth_view.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/classes/request_handler.dart';
import '../../core/constants/images_constants.dart';
import '../../controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009689),
      body: Obx(() {
        final isSignIn = controller.isSignIn.value;

        return RequestHandlerView(
          onRetry: controller.retry,
          status: controller.requestStatus.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                children: [
                  30.verticalSpace,
                  Container(
                    width: 80.w,
                    height: 80.w,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      ImagesConstants.kLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    "Vet Vision",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 20,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    isSignIn
                        ? "Welcome back! Sign in to continue."
                        : "Create your account today.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Form(
                      key: controller.authFormKey,
                      child: AdaptiveLayout(
                        mobileLayout:
                            (context) => MobileAuthView(controller: controller),
                        tabletLayout:
                            (context) => TabletAuthView(controller: controller),
                        desktopLayout:
                            (context) =>
                                DesktopAuthView(controller: controller),
                      ),
                    ),
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
