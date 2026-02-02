import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.btnTitle,
    super.key,
  });

  final String btnTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: Text(
        btnTitle,
        style: TextStyle(fontSize: 16.sp, color: const Color(0XFF6A7282)),
      ),
    );
  }
}

