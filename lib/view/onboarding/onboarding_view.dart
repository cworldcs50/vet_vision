import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/custom_slider.dart';
import 'widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_text_button.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/custom_elevated_button.dart';
import '../../data/datasource/static/on_boarding_data.dart';
import '../../controller/on_boarding_controller/on_boarding_controller.dart';

class OnboardingView extends GetView<OnBoardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          CustomTextButton(onPressed: controller.skip, btnTitle: "Skip"),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: CustomPageView(
              next: controller.next,
              onPageChanged: controller.onPageChanged,
              pageController: controller.pageController,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomSlider(),
                15.verticalSpace,
                GetBuilder<OnBoardingController>(
                  builder: (controller) {
                    return CustomElevatedButton(
                      buttonTitle:
                          controller.currentPageIndex ==
                                  kOnBoardingData.length - 1
                              ? "Get Started"
                              : "Next\t\t>",
                      onPressed: controller.next,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
