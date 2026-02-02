import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeTitle extends StatelessWidget {
  const CustomHomeTitle({required this.onTap, super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: 35.w,
                    height: 35.h,
                    margin: EdgeInsets.only(left: 10.w),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF40D9C8),
                    ),
                    child: Icon(Icons.pets, color: Colors.red, size: 21.sp),
                  ),
                ),
                10.horizontalSpace,
                Text(
                  "VetVision",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onTap,
                  icon: Icon(Icons.settings_outlined, size: 22.sp),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
