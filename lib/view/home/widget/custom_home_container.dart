import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_home_icon.dart';
import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.subTitle,
  });

  final IconData icon;
  final void Function() onTap;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 90.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0XFFEDFDFD),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 15,
              ),
            ),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 12,
              ),
            ),
          ),
          leading: CustomHomeIcon(
            backgroundHeight: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 40,
            ),
            backgroundWidth: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 40,
            ),
            icon: icon,
            iconSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 20,
            ),
            iconColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
