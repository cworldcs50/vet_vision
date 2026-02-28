import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/mobile_book_appointment.dart';
import 'widgets/desktop_book_appointment.dart';
import 'widgets/tablet_book_appointement.dart';
import '../../core/classes/adaptive_layout.dart';
import '../home/widget/custom_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

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
        leading: Container(
          width: 35.w,
          height: 35.h,
          margin: EdgeInsets.only(left: 10.w),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0XFF40D9C8),
          ),
          child: Icon(
            Icons.pets,
            color: Colors.red,
            size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 21),
          ),
        ),
      ),

      body: AdaptiveLayout(
        desktopLayout: (context) => const DesktopBookAppointment(),
        mobileLayout: (context) => const MobileBookAppointment(),
        tabletLayout: (context) => const TabletBookAppointment(),
      ),
    );
  }
}
