import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckoutDoctorCard extends StatelessWidget {
  const CustomCheckoutDoctorCard({
    super.key,
    required this.imgPath,
    required this.doctorName,
    required this.specialty,
    required this.price,
  });

  final String imgPath;
  final String doctorName;
  final String specialty;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 24),
          backgroundImage: AssetImage(imgPath),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 15,
                  ),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                specialty,
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 12,
                  ),
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "\$${price.toStringAsFixed(0)} per session",
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 11,
                  ),
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
