import '../app_binding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_pages.dart';
import '../core/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VetVision extends StatelessWidget {
  const VetVision({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (context, child) {
        return SafeArea(
          child: GetMaterialApp(
            home: child,
            getPages: kAppPages,
            initialBinding: AppBinding(),
            title: AppConstants.kAppTitle,

            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
