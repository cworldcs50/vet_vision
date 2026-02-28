import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorImage extends StatelessWidget {
  const CustomDoctorImage({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: Image.asset(imgPath, fit: BoxFit.cover),
      ),
    );
  }
}
