import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/images_constants.dart';
import '../../controller/logo/logo_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LogoController>(
        builder: (controller) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFF008091),
                  Color(0XFF00A595),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  AnimatedOpacity(
                    onEnd: controller.oEnd,
                    duration: controller.duration,
                    opacity: controller.isVisible ? 1.0 : 0.0,
                    child: Image.asset(
                      ImagesConstants.kLogo,
                      width: 600.w,
                      height: 600.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
