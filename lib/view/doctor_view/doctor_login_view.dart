import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/auth/auth_controller.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/constants/images_constants.dart';
import '../../core/routes/app_routes_name.dart';
import '../auth/widgets/custom_text_form_field.dart';
import '../auth/widgets/custom_auth_button.dart';

class DoctorLoginView extends GetView<AuthController> {
  const DoctorLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009689),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: const BoxDecoration(
                  color: Colors.white24,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.medical_services_outlined,
                  color: Colors.white,
                  size: 40.w,
                ),
              ),
              16.verticalSpace,
              Text(
                "Doctor Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              8.verticalSpace,
              Text(
                "Access your doctor portal",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 14),
                ),
              ),
              30.verticalSpace,
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Form(
                  key: controller.authFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        hint: "doctor@example.com",
                        label: "Email Address",
                        prefixIcon: Icons.email_outlined,
                        controller: controller.emailController,
                        validator: controller.emailValidator,
                      ),
                      16.verticalSpace,
                      GetBuilder<AuthController>(
                        builder: (c) => CustomTextFormField(
                          hint: "********",
                          label: "Password",
                          obscureText: c.showPassword,
                          onPressed: c.visiblePassword,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: c.showPasswordSuffixIcon,
                          controller: controller.passwordController,
                          validator: controller.passwordValidator,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: Checkbox(
                                  value: true,
                                  onChanged: (v) {},
                                  activeColor: const Color(0xFF009689),
                                ),
                              ),
                              8.horizontalSpace,
                              Text(
                                "Remember me",
                                style: TextStyle(color: Colors.black54, fontSize: 12.sp),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () => controller.forgetPassword(),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: const Color(0xFF009689),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      CustomAuthButton(
                        backgroundColor: const Color(0xFF009689),
                        onPressed: () => controller.signIn(),
                        child: const Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              "or continue with",
                              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),
                      20.verticalSpace,
                      _SocialLoginButton(
                        iconPath: ImagesConstants.googleIcon,
                        text: "Google",
                        onPressed: () => controller.authWithGoogle(),
                      ),
                      12.verticalSpace,
                      _SocialLoginButton(
                        icon: Icons.facebook,
                        iconColor: const Color(0xFF1877F2),
                        text: "Facebook",
                        onPressed: () => controller.authWithFacebook(),
                      ),
                      24.verticalSpace,
                      Center(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutesName.rDoctorSignUp),
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                              children: [
                                 const TextSpan(
                                  text: "Register as Doctor",
                                  style: TextStyle(
                                    color:  Color(0xFF009689),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final String? iconPath;
  final IconData? icon;
  final Color? iconColor;
  final String text;
  final VoidCallback onPressed;

  const _SocialLoginButton({
    this.iconPath,
    this.icon,
    this.iconColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null)
            Image.asset(iconPath!, height: 20.w)
          else if (icon != null)
            Icon(icon, color: iconColor, size: 20.w),
          12.horizontalSpace,
          Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
