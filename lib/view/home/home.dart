import 'widget/custom_home_body.dart';
import 'widget/custom_home_icon.dart';
import 'package:flutter/material.dart';
import 'widget/custom_home_title.dart';
import '../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CustomHomeTitle(
            onTap:
                () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const CustomBottomSheet(),
                ),
          ),
          35.verticalSpace,
          CustomHomeIcon(
            backgroundHeight: 60.sp,
            backgroundWidth: 60.sp,
            icon: FontAwesomeIcons.hospital,
            iconColor: Colors.red,
            iconSize: 25.sp,
          ),
          10.verticalSpace,
          Text(
            "Welcome to VetVision",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          5.verticalSpace,
          Text(
            "Your trusted veterinary platform",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          30.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w),
            child: const CustomHomeBody(),
          ),
        ],
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.r),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Settings"),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_sharp),
                ),
              ],
            ),
            15.verticalSpace,
            Row(
              children: [
                const Icon(Icons.public, color: Colors.tealAccent),
                15.horizontalSpace,
                const Text("Language"),
              ],
            ),
            15.verticalSpace,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: const Text("English"),
            ),
            8.verticalSpace,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: const Text("Arabic"),
            ),

            TextButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                alignment: Alignment.centerLeft,
                minimumSize: Size(double.infinity, 50.h),
                iconColor: Colors.red,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(),
                
              ),
              icon: const Icon(Icons.exit_to_app),
              label: const Text("Sign Out"),
            ),
          ],
        ),
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
