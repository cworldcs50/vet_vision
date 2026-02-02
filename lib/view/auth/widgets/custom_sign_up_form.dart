import 'package:get/get.dart';
import 'custom_auth_button.dart';
import 'custom_auth_options.dart';
import 'custom_check_box.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'custom_agree_to_terms_text.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/constants/images_constants.dart';
import '../../../controller/auth/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({required this.signUpController, super.key});

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        children: [
          20.verticalSpace,
          CustomTextFormField(
            label: "Full Name",
            hint: "Enter your full name",
            prefixIcon: Icons.person_2_outlined,
            validator: signUpController.fullNameValidator,
            controller: signUpController.fullNameController,
          ),
          20.verticalSpace,
          CustomTextFormField(
            label: "Email",
            hint: "Enter your email",
            controller: signUpController.emailController,
            prefixIcon: Icons.email_outlined,
            validator: signUpController.emailValidator,
          ),
          20.verticalSpace,
          GetBuilder<SignUpController>(
            builder: (controller) {
              return CustomTextFormField(
                label: "Password",
                hint: "Enter your password",
                obscureText: controller.showPassword,
                onPressed: controller.visiblePassword,
                prefixIcon: Icons.lock_outline_rounded,
                validator: signUpController.passwordValidator,
                suffixIcon: controller.showPasswordSuffixIcon,
                controller: signUpController.passwordController,
              );
            },
          ),
          20.verticalSpace,
          GetBuilder<SignUpController>(
            builder: (controller) {
              return CustomTextFormField(
                label: "Confirm Password",
                hint: "Confirm your password",
                prefixIcon: Icons.lock_outline_rounded,
                obscureText: controller.showConfirmedPassword,
                onPressed: controller.visibleConfirmedPassword,
                suffixIcon: controller.showConfirmedPasswordSuffixIcon,
                validator: signUpController.confirmedPasswordValidator,
                controller: signUpController.confirmedPasswordController,
              );
            },
          ),
          10.verticalSpace,
          GetBuilder<SignUpController>(
            builder: (controller) {
              return Row(
                children: [
                  CustomCheckBox(
                    onChanged: controller.onChanged,
                    value: controller.checkBoxValue,
                  ),
                  Flexible(
                    child: CustomAgreeToTermsText(
                      fontWeight:
                          signUpController.checkBoxValue
                              ? FontWeight.normal
                              : FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
          5.verticalSpace,
          CustomAuthButton(
            onPressed: signUpController.signUp,
            backgroundColor: AppColors.primaryColor,
            child: const Text(
              "Create Account",
              style: TextStyle(color: Colors.white),
            ),
          ),
          20.verticalSpace,
          const CustomAuthOptions(option: "or sign up with"),
          10.verticalSpace,
          CustomAuthButton(
            onPressed: signUpController.signUpWithGoogle,
            backgroundColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImagesConstants.googleIcon, width: 13.w),
                15.horizontalSpace,
                const Text(
                  "Continue with Google",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          CustomAuthButton(
            onPressed: signUpController.signUpWithFacebook,
            backgroundColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: const Color(0XFF1877F2),
                  size: 15.w,
                ),
                15.horizontalSpace,
                const Text(
                  "Continue with facebook",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(color: Color(0XFF4A5565)),
              ),
              TextButton(
                onPressed: signUpController.returnToSignIn,
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 15.sp,
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
