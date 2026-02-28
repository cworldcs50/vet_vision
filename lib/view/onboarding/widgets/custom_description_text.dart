import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(0xFF6A7282),
        fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 18),
      ),
    );
  }
}
