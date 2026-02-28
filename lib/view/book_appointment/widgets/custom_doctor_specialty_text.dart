import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CustomDoctorSpecialtyText extends StatelessWidget {
  const CustomDoctorSpecialtyText({super.key, required this.specialty});

  final String specialty;
  @override
  Widget build(BuildContext context) {
    return Text(
      specialty,
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
