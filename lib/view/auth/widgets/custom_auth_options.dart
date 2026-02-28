import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/classes/adaptive_layout.dart';

class CustomAuthOptions extends StatelessWidget {
  const CustomAuthOptions({super.key, required this.option});

  final String option;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            endIndent: 5.w,
            thickness: 0.5.w,
            color: const Color(0xFF6A7282),
          ),
        ),
        Text(
          option,
          style: TextStyle(
            fontSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 16,
            ),
            color: const Color(0XFF6A7282),
          ),
        ),
        Expanded(
          child: Divider(
            indent: 5.w,
            thickness: 0.5.w,
            color: const Color(0xFF6A7282),
          ),
        ),
      ],
    );
  }
}
