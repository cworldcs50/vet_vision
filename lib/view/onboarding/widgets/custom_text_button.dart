import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';

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
        style: TextStyle(
          fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 15),
          color: const Color(0XFF6A7282),
        ),
      ),
    );
  }
}
