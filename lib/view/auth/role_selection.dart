import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/constants/images_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/auth/role_selection_controller.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final RoleSelectionController controller = Get.put(
      RoleSelectionController(),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF009689),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Image.asset(
              ImagesConstants.kLogo,
              width: 60.w,
              height: 60.w,
            ),
          ),
          10.verticalSpace,
          Text(
            "Vet Vision",
            style: TextStyle(
              color: Colors.white,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 24,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
          8.verticalSpace,
          Text(
            "Your trusted veterinary care platform",
            style: TextStyle(
              color: Colors.white70,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 12,
              ),
            ),
          ),
          const Spacer(),
          Text(
            "WHO ARE YOU?",
            style: TextStyle(
              color: Colors.white,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 10,
              ),
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.r),
            child: AdaptiveLayout(
              mobileLayout:
                  (context) => MobileRoleSelection(controller: controller),
              tabletLayout:
                  (context) => TabletRoleSelection(controller: controller),
              desktopLayout:
                  (context) => DesktopRoleSelection(controller: controller),
            ),
          ),
          const Spacer(flex: 2),
          Text(
            "© 2026 Vet Vision. All rights reserved.",
            style: TextStyle(
              color: Colors.white60,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 12,
              ),
            ),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}

class MobileRoleSelection extends StatelessWidget {
  const MobileRoleSelection({super.key, required this.controller});

  final RoleSelectionController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RoleCard(
            title: "I'm a Doctor",
            icon: Icons.medical_services_outlined,
            onTap: () => controller.selectRole(true),
            subtitle: "Manage your appointments & patients",
          ),
          16.verticalSpace,
          RoleCard(
            title: "I'm a Client",
            icon: Icons.person_outline,
            onTap: () => controller.selectRole(false),
            subtitle: "Find & book a vet for your pet",
          ),
        ],
      ),
    );
  }
}

class TabletRoleSelection extends StatelessWidget {
  const TabletRoleSelection({super.key, required this.controller});

  final RoleSelectionController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RoleCard(
              title: "I'm a Doctor",
              icon: Icons.medical_services_outlined,
              onTap: () => controller.selectRole(true),
              subtitle: "Manage your appointments & patients",
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: RoleCard(
              title: "I'm a Client",
              icon: Icons.person_outline,
              onTap: () => controller.selectRole(false),
              subtitle: "Find & book a vet for your pet",
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopRoleSelection extends StatelessWidget {
  const DesktopRoleSelection({super.key, required this.controller});

  final RoleSelectionController controller;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RoleCard(
              title: "I'm a Doctor",
              icon: Icons.medical_services_outlined,
              onTap: () => controller.selectRole(true),
              subtitle: "Manage your appointments & patients",
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: RoleCard(
              icon: Icons.person_outline,
              title: "I'm a Client",
              subtitle: "Find & book a vet for your pet",
              onTap: () => controller.selectRole(false),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.subtitle,
  });

  final String title;
  final IconData icon;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE0F7FA),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF009689),
                size: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 22,
                ),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF009689),
              size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
