import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/datasource/static/on_boarding_data.dart';
import '../../../controller/on_boarding_controller/on_boarding_controller.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            kOnBoardingData.length,
            (index) => AnimatedContainer(
              height: 7.h,
              margin: EdgeInsets.only(right: 5.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              duration: const Duration(milliseconds: 1200),
              width: controller.currentPageIndex == index ? 20.w : 10.w,
            ),
          ),
        );
      },
    );
  }
}
