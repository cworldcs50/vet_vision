import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/classes/adaptive_layout.dart';

class AuthToggleTabs extends StatelessWidget {
  const AuthToggleTabs({
    super.key,
    required this.isSignIn,
    required this.controller,
  });

  final bool isSignIn;
  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => controller.toggleTab(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: isSignIn ? Colors.white : Colors.transparent,
                  boxShadow:
                      isSignIn
                          ? [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 10,
                    ),
                    fontWeight: isSignIn ? FontWeight.bold : FontWeight.w600,
                    color: isSignIn ? const Color(0xFF009689) : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => controller.toggleTab(false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: !isSignIn ? Colors.white : Colors.transparent,
                  boxShadow:
                      !isSignIn
                          ? [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ]
                          : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: !isSignIn ? const Color(0xFF009689) : Colors.grey,
                    fontWeight: !isSignIn ? FontWeight.bold : FontWeight.w600,
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
