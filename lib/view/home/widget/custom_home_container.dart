import 'custom_home_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color(0XFFEDFDFD),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: CustomHomeIcon(
          backgroundHeight: 40.h,
          backgroundWidth: 40.w,
          icon: icon,
          iconColor: Colors.white,
          iconSize: 25.sp,
        ),
      ),
    );
  }
}
