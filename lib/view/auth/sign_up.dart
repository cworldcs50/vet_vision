import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/classes/request_handler.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/custom_agree_to_terms_text.dart';
import 'widgets/custom_auth_button.dart';
import 'widgets/custom_auth_options.dart';
import 'widgets/custom_check_box.dart';
import 'widgets/custom_sign_up_form.dart';
import '../../core/constants/images_constants.dart';
import '../../controller/auth/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_text_form_field.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: Obx(() {
        return RequestHandlerView(
          status: controller.requestStatus.value,
          onRetry: controller.retry,
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
                    "Create Account",
                    style: TextStyle(
                      color: const Color(0XFF009689),
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 24,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "Join VetVision today",
                    style: TextStyle(
                      color: const Color(0XFF4A5565),
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
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
                        child: AdaptiveLayout(
                          mobileLayout:
                              (context) => CustomSignUpForm(
                                signUpController: controller,
                              ),
                          tabletLayout:
                              (context) => SignUpTabletLayout(
                                signUpController: controller,
                              ),
                          desktopLayout:
                              (context) => SignUpDesktopLayout(
                                signUpController: controller,
                              ),
                        ),
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

class SignUpTabletLayout extends StatelessWidget {
  const SignUpTabletLayout({required this.signUpController, super.key});

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        children: [
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Full Name",
                  hint: "Enter your full name",
                  prefixIcon: Icons.person_2_outlined,
                  validator: signUpController.fullNameValidator,
                  controller: signUpController.fullNameController,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: CustomTextFormField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: signUpController.emailController,
                  prefixIcon: Icons.email_outlined,
                  validator: signUpController.emailValidator,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                child: GetBuilder<SignUpController>(
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
              ),
              20.horizontalSpace,
              Expanded(
                child: GetBuilder<SignUpController>(
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
              ),
            ],
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
            child: Text(
              "Create Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          20.verticalSpace,
          const CustomAuthOptions(option: "or sign up with"),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomAuthButton(
                  backgroundColor: Colors.white,
                  onPressed: signUpController.signUpWithGoogle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagesConstants.googleIcon,
                        width: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 10,
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
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomAuthButton(
                  onPressed: signUpController.signUpWithFacebook,
                  backgroundColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: const Color(0XFF1877F2),
                        size: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 10,
                        ),
                      ),
                      15.horizontalSpace,
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
              ),
            ],
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: const Color(0XFF4A5565),
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                ),
              ),
              15.horizontalSpace,
              TextButton(
                onPressed: signUpController.returnToSignIn,
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: Text(
                  "Sign In",
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

class SignUpDesktopLayout extends StatelessWidget {
  const SignUpDesktopLayout({required this.signUpController, super.key});

  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        children: [
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Full Name",
                  hint: "Enter your full name",
                  prefixIcon: Icons.person_2_outlined,
                  validator: signUpController.fullNameValidator,
                  controller: signUpController.fullNameController,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: CustomTextFormField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: signUpController.emailController,
                  prefixIcon: Icons.email_outlined,
                  validator: signUpController.emailValidator,
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: GetBuilder<SignUpController>(
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
              ),
              20.horizontalSpace,
              Expanded(
                child: GetBuilder<SignUpController>(
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
              ),
            ],
          ),
          20.verticalSpace,

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
            child: Text(
              "Create Account",
              style: TextStyle(
                color: Colors.white,
                fontSize: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          20.verticalSpace,
          const CustomAuthOptions(option: "or sign up with"),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomAuthButton(
                  backgroundColor: Colors.white,
                  onPressed: signUpController.signUpWithGoogle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImagesConstants.googleIcon,
                        width: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 10,
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
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomAuthButton(
                  onPressed: signUpController.signUpWithFacebook,
                  backgroundColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: const Color(0XFF1877F2),
                        size: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 10,
                        ),
                      ),
                      15.horizontalSpace,
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
              ),
            ],
          ),
          15.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: const Color(0XFF4A5565),
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                ),
              ),
              15.horizontalSpace,
              TextButton(
                onPressed: signUpController.returnToSignIn,
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: Text(
                  "Sign In",
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
