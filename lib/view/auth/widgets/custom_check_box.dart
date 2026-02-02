import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: value,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        } else {
          return const Color(0XFF99A1AF);
        }
      }),
      side: BorderSide(color: const Color(0XFF4A5565), width: 0.5.w),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
