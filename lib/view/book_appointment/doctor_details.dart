import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/classes/adaptive_layout.dart';
import 'widgets/mobile_doctor_details.dart';
import 'widgets/tablet_doctor_details.dart';
import 'widgets/desktop_doctor_details.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          "Doctor Profile",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 15,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileDoctorDetails(),
        tabletLayout: (context) => const TabletDoctorDetails(),
        desktopLayout: (context) => const DesktopDoctorDetails(),
      ),
    );
  }
}
