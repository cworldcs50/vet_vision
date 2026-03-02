import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedBtn extends StatelessWidget {
  const CustomElevatedBtn({
    super.key,
    required this.btnTitle,
    required this.onPressed,
  });

  final String btnTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: Text(
        btnTitle,
        style: TextStyle(
          fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 15),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
