import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    required this.onPressed,
    required this.backgroundColor,

    required this.child,
    super.key,
  });

  final void Function() onPressed;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(250.w, 38.h),
        maximumSize: Size(250.w, 38.h),
        minimumSize: Size(250.w, 38.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      child: child,
    );
  }
}
