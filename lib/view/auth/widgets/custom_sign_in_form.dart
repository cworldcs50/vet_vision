import 'package:get/get.dart';
import '../../../core/classes/adaptive_layout.dart';
import '../../../core/routes/app_routes_name.dart';
import 'custom_auth_button.dart';
import 'custom_auth_options.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/images_constants.dart';
import '../../../controller/auth/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key, required this.controller});

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signInFormKey,
      child: Column(
        children: [
          20.verticalSpace,
          CustomTextFormField(
            label: "Email",
            hint: "Enter your email",
            prefixIcon: Icons.email_outlined,
            validator: controller.emailValidator,
            controller: controller.emailController,
          ),
          20.verticalSpace,
          GetBuilder<SignInController>(
            builder: (controller) {
              return CustomTextFormField(
                label: "Password",
                hint: "Enter your password",
                obscureText: controller.showPassword,
                onPressed: controller.visiblePassword,
                prefixIcon: Icons.lock_outline_rounded,
                validator: controller.passwordValidator,
                controller: controller.passwordController,
                suffixIcon: controller.showPasswordSuffixIcon,
              );
            },
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed:
                  () async => await Get.toNamed(AppRoutesName.rForgetPassword),
              style: TextButton.styleFrom(overlayColor: Colors.transparent),
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  color: const Color(0XFF009689),
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          CustomAuthButton(
            onPressed: controller.signIn,
            backgroundColor: AppColors.primaryColor,
            child: const Text("Sign in", style: TextStyle(color: Colors.white)),
          ),
          20.verticalSpace,
          const CustomAuthOptions(option: "or continue with"),
          10.verticalSpace,
          CustomAuthButton(
            onPressed: controller.signInWithGoogle,
            backgroundColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesConstants.googleIcon,
                  width: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                ),
                15.horizontalSpace,
                Text(
                  "Continue with Google",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          CustomAuthButton(
            onPressed: controller.signInWithFacebook,
            backgroundColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: const Color(0XFF1877F2),
                  size: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                ),
                10.horizontalSpace,
                Text(
                  "Continue with facebook",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  color: const Color(0XFF4A5565),
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                ),
              ),
              TextButton(
                onPressed: controller.goToSignUp,
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 15,
                    ),
                    color: const Color(0XFF009689),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
