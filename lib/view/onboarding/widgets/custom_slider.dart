import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/datasource/static/on_boarding_data.dart';
import '../../../controller/on_boarding_controller/on_boarding_controller.dart';
import 'package:vet_vision_2/core/classes/adaptive_layout.dart';


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
              height: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 7),
              margin: EdgeInsets.only(right: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 5)),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10)),
              ),
              duration: const Duration(milliseconds: 1200),
              width: controller.currentPageIndex == index ? AdaptiveLayout.getResponsiveFontSize(context, fontSize: 20) : AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10),
            ),
          ),
        );
      },
    );
  }
}
