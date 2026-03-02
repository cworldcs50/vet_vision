import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAdditionalNotes extends StatelessWidget {
  const CustomAdditionalNotes({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.edit_note_rounded,
              size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 18),
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 6.w),
            Text(
              "Additional Notes (Optional)",
              style: TextStyle(
                fontSize: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 16,
                ),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: controller,
          maxLines: 3,
          style: TextStyle(
            fontSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 13,
            ),
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText:
                "Share any specific concerns or information with the doctor...",
            hintStyle: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 12,
              ),
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
