import 'package:flutter/material.dart';
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
        backgroundColor: const Color(0XFF00BBA7),
        foregroundColor: const Color(0XFFFFFFFF),
        minimumSize: Size(50.w, 30.h),
        maximumSize: Size(300.w, 40.h),
        fixedSize: Size(300.w, 40.h),
      ),
      child: Text(buttonTitle, style: TextStyle(fontSize: 16.sp)),
    );
  }
}
