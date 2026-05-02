import '../app_binding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core/routes/app_pages.dart';
import '../core/constants/app_constants.dart';
import '../core/routes/app_routes_name.dart';

class VetVision extends StatelessWidget {
  const VetVision({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        getPages: kAppPages,
        initialBinding: AppBinding(),
        title: AppConstants.kAppTitle,
        initialRoute: AppRoutesName.rLogo,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
