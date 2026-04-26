import 'package:get/get.dart';
import 'widgets/custom_section.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/custom_setting_option.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../controller/profile/profile_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: AppColors.primaryColor.withValues(
                      alpha: 0.1,
                    ),
                    child: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                      size: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 20,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "user@example.com",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 8.h,
                      ),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            const CustomSection(
              title: "General",
              items: [
                CustomSettingOption(icon: Icons.pets, title: "My Pets"),

                CustomSettingOption(
                  icon: Icons.favorite_border,
                  title: "Favorite Doctors",
                ),
                CustomSettingOption(
                  icon: Icons.payment,
                  title: "Payment Methods",
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const CustomSection(
              title: "Settings",
              items: [
                CustomSettingOption(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                ),
                CustomSettingOption(icon: Icons.security, title: "Security"),
                CustomSettingOption(
                  icon: Icons.help_outline,
                  title: "Help & Support",
                ),
                CustomSettingOption(
                  title: "Logout",
                  icon: Icons.logout,
                  iconColor: Colors.red,
                  textColor: Colors.red,
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
