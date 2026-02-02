import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessSignIn extends StatelessWidget {
  const SuccessSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Text("🎉", style: TextStyle(fontSize: 50.sp))),
            Text(
              "Welcome to VetVision!",
              style: TextStyle(color: const Color(0XFF009689), fontSize: 16.sp),
            ),
            const Flexible(
              child: Text(
                "You're now signed in! The main app experience would start here.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0XFF4A5565)),
              ),
            ),

            ElevatedButton(
              onPressed: () async => await Get.offAllNamed(AppRoutesName.rHome),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                "Let's Start!",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
