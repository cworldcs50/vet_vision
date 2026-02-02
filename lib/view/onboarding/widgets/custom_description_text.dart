import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14.sp, color: const Color(0xFF6A7282)),
    );
  }
}