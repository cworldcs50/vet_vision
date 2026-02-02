import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.validator,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.onPressed,
  });

  final String label, hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final void Function()? onPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        5.verticalSpace,
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          cursorWidth: 2.w,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                suffixIcon,
                size: 17.sp,
                color: const Color(0XFF999AAF),
              ),
            ),
            alignLabelWithHint: true,
            focusColor: const Color(0XFF999AAF),
            prefixIcon: Icon(
              prefixIcon,
              size: 20.sp,
              color: const Color(0XFF999AAF),
            ),
            prefixIconColor: const Color(0XFF999AAF),
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: const Color(0XFFf3f3f5),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0XFF999AAF),
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0XFF999AAF)),
              borderRadius: BorderRadius.circular(14.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0XFF999AAF),
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(14.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
        ),
      ],
    );
  }
}
