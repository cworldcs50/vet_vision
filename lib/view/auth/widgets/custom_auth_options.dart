import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            color: const Color(0xFF6A7282),
            thickness: 0.5.w,
            endIndent: 5.w,
          ),
        ),
        Text(
          option,
          style: TextStyle(fontSize: 16.sp, color: const Color(0XFF6A7282)),
        ),
        Expanded(
          child: Divider(
            color: const Color(0xFF6A7282),
            thickness: 0.5.w,
            indent: 5.w,
          ),
        ),
      ],
    );
  }
}
