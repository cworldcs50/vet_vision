import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/classes/request_handler.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends GetView<AuthController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: Obx(
        () => RequestHandlerView(
          onRetry: controller.retry,
          status: controller.requestStatus.value,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forget Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0XFF4A5565),
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: TextFormField(
                    controller: controller.forgetPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.emailValidator,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    cursorWidth: 2.w,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 12,
                        ),
                      ),
                      hintText: "Enter Email to send token on it",
                      prefixIcon: IconButton(
                        onPressed: controller.forgetPassword,
                        icon: Icon(
                          Icons.email_outlined,
                          size: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 17,
                          ),
                          color: const Color(0XFF999AAF),
                        ),
                      ),
                      alignLabelWithHint: true,
                      focusColor: const Color(0XFF999AAF),
                      prefixIconColor: const Color(0XFF999AAF),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: const Color(0XFFf3f3f5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0XFF999AAF),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0XFF999AAF)),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0XFF999AAF),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
