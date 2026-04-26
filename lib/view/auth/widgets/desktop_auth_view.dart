import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/classes/adaptive_layout.dart';
import '../../../core/constants/images_constants.dart';
import 'custom_auth_button.dart';
import 'custom_text_form_field.dart';

class DesktopAuthView extends StatelessWidget {
  const DesktopAuthView({super.key, required this.controller});

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!controller.isSignIn.value) ...[
          CustomTextFormField(
            hint: "John Doe",
            label: "Full Name",
            prefixIcon: Icons.person_outline,
            validator: controller.fullNameValidator,
            controller: controller.fullNameController,
          ),
          16.verticalSpace,
        ],
        Row(
          children: [
            Flexible(
              child: CustomTextFormField(
                label: "Email Address",
                hint: "you@example.com",
                prefixIcon: Icons.email_outlined,
                validator: controller.emailValidator,
                controller: controller.emailController,
              ),
            ),
            16.horizontalSpace,
            Flexible(
              child: GetBuilder<AuthController>(
                builder:
                    (c) => CustomTextFormField(
                      hint: "••••••••",
                      label: "Password",
                      obscureText: c.showPassword,
                      onPressed: c.visiblePassword,
                      validator: c.passwordValidator,
                      controller: c.passwordController,
                      suffixIcon: c.showPasswordSuffixIcon,
                      prefixIcon: Icons.lock_outline_rounded,
                    ),
              ),
            ),
          ],
        ),
        if (!controller.isSignIn.value) ...[
          16.verticalSpace,
          GetBuilder<AuthController>(
            builder:
                (c) => CustomTextFormField(
                  hint: "••••••••",
                  label: "Confirm Password",
                  obscureText: c.showConfirmedPassword,
                  onPressed: c.visibleConfirmedPassword,
                  prefixIcon: Icons.lock_outline_rounded,
                  validator: c.confirmedPasswordValidator,
                  suffixIcon: c.showConfirmedPasswordSuffixIcon,
                  controller: c.confirmedPasswordController,
                ),
          ),
        ],
        if (controller.isSignIn.value) ...[
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: controller.forgetPassword,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xFF009689),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ] else
          24.verticalSpace,
        CustomAuthButton(
          onPressed:
              controller.isSignIn.value ? controller.signIn : controller.signUp,
          backgroundColor: const Color(0xFF009689),
          child: Text(
            controller.isSignIn.value ? "Sign In" : "Create Account",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        24.verticalSpace,
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey.shade300)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Text(
                "or continue with",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey.shade300)),
          ],
        ),
        20.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomAuthButton(
                onPressed: controller.authWithGoogle,
                backgroundColor: Colors.white,
                isOutlined: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImagesConstants.googleIcon,
                      height: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Google",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: CustomAuthButton(
                onPressed: controller.authWithFacebook,
                backgroundColor: Colors.white,
                isOutlined: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.facebook, color: Color(0XFF1877F2)),
                    const Spacer(),
                    Text(
                      "Facebook",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 12,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        24.verticalSpace,
        Center(
          child: GestureDetector(
            onTap: () => controller.toggleTab(!controller.isSignIn.value),
            child: RichText(
              text: TextSpan(
                text:
                    controller.isSignIn.value
                        ? "Don't have an account? "
                        : "Already have an account? ",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 13,
                  ),
                ),
                children: [
                  TextSpan(
                    text: controller.isSignIn.value ? "Sign Up" : "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF009689),
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

