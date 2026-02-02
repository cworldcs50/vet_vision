import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/classes/request_handler.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/custom_sign_in_form.dart';
import '../../core/constants/images_constants.dart';
import '../../controller/auth/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends GetView<SignInController> {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: Obx(() {
        return RequestHandlerView(
          onRetry: controller.retry,
          status: controller.requestStatus.value,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  15.verticalSpace,
                  Image.asset(
                    ImagesConstants.kLogo,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                  15.verticalSpace,
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: const Color(0XFF009689),
                      fontSize: 24.sp,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Sign in to continue to VetVision",
                    style: TextStyle(
                      color: const Color(0XFF4A5565),
                      fontSize: 16.sp,
                    ),
                  ),
                  20.verticalSpace,
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                        child: CustomSignInForm(controller: controller),
                      ),
                    ),
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
