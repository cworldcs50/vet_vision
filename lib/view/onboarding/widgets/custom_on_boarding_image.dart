import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({required this.imgPath, super.key});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(imgPath, fit: BoxFit.cover),
    );
  }
}