import 'package:get/get.dart';
import 'widget/custom_home_body.dart';
import 'widget/custom_home_icon.dart';
import 'package:flutter/material.dart';
import 'widget/custom_bottom_sheet.dart';
import '../../core/theme/app_colors.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../controller/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        actions: [
          IconButton(
            onPressed:
                () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const CustomBottomSheet(),
                ),
            icon: Icon(
              Icons.settings_outlined,
              size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 25),
            ),
          ),
        ],
        title: Text(
          "VetVision",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 15,
            ),
          ),
        ),
        leading: Icon(
          Icons.pets,
          color: Colors.red,
          size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 21),
        ),
      ),
      body: Column(
        children: [
          CustomHomeIcon(
            iconSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 25,
            ),
            backgroundWidth: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 60,
            ),
            backgroundHeight: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 60,
            ),
            iconColor: Colors.red,
            icon: FontAwesomeIcons.hospital,
          ),
          10.verticalSpace,
          Text(
            "Welcome to VetVision",
            style: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 20,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          5.verticalSpace,
          Text(
            "Your trusted veterinary platform",
            style: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 12,
              ),
              fontWeight: FontWeight.w400,
            ),
          ),
          30.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: CustomHomeBody(
              goToMyPets: controller.goToMyPets,
              goToHealthRecords: controller.goToHealthRecords,
              goToBookAppointement: controller.goToBookAppointement,
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Material(
                        color: Colors.white,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                const Text("Settings"),
                                const Spacer(),
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(Icons.close_sharp),
                                ),
                              ],
                            ),
                            15.verticalSpace,
                            Row(
                              children: [
                                const Icon(
                                  Icons.public,
                                  color: Colors.tealAccent,
                                ),
                                15.horizontalSpace,
                                const Text("Language"),
                              ],
                            ),
                          ],
                        ),
                      ),
                
 */
