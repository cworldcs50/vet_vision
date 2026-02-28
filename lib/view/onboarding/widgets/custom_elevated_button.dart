import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.buttonTitle,
    required this.onPressed,
    super.key,
  });

  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        fixedSize: Size(200.w, 40.h),
        minimumSize: Size(50.w, 30.h),
        maximumSize: Size(200.w, 40.h),
        foregroundColor: const Color(0XFFFFFFFF),
        backgroundColor: const Color(0XFF00BBA7),
      ),
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
        ),
      ),
    );
  }
}
