import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/doctor/doctor_portal_controller.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'dashboard/doctor_dashboard_view.dart';
import 'appointments/doctor_appointments_view.dart';
import 'profile/doctor_profile_view.dart';

class DoctorPortalMainView extends GetView<DoctorPortalController> {
  const DoctorPortalMainView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<DoctorPortalController>()) {
      Get.put(DoctorPortalController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const _PortalHeader(),
            Expanded(
              child: Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return const DoctorDashboardView();
                  case 1:
                    return const DoctorAppointmentsView();
                  case 2:
                    return const DoctorProfileView();
                  default:
                    return const DoctorDashboardView();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _PortalHeader extends GetView<DoctorPortalController> {
  const _PortalHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: const BoxDecoration(
        color: Color(0xFF009689),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _HeaderIconButton(
                icon: Icons.arrow_back,
                onPressed: () => Get.back(),
              ),
              Column(
                children: [
                  Text(
                    "Doctor Portal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Dr. Ahmed Hassan",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 12),
                    ),
                  ),
                ],
              ),
              _HeaderIconButton(
                icon: Icons.logout,
                onPressed: () => controller.logout(),
              ),
            ],
          ),
          20.verticalSpace,
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                _NavButton(
                  title: "Dashboard",
                  index: 0,
                  icon: Icons.dashboard_outlined,
                  isSelected: controller.selectedIndex.value == 0,
                ),
                _NavButton(
                  title: "Appointments",
                  index: 1,
                  icon: Icons.calendar_today_outlined,
                  isSelected: controller.selectedIndex.value == 1,
                ),
                _NavButton(
                  title: "Profile",
                  index: 2,
                  icon: Icons.person_outline,
                  isSelected: controller.selectedIndex.value == 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white24,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20.w),
        onPressed: onPressed,
      ),
    );
  }
}

class _NavButton extends GetView<DoctorPortalController> {
  final String title;
  final int index;
  final IconData icon;
  final bool isSelected;

  const _NavButton({
    required this.title,
    required this.index,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final bool selected = controller.selectedIndex.value == index;
        return GestureDetector(
          onTap: () => controller.updateIndex(index),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: Offset(0, 2.h),
                      )
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16.w,
                  color: selected ? const Color(0xFF009689) : Colors.white,
                ),
                4.horizontalSpace,
                Text(
                  title,
                  style: TextStyle(
                    color: selected ? const Color(0xFF009689) : Colors.white,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
