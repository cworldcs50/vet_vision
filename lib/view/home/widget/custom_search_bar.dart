import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 12),
        horizontal: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, 5),
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 22),
          ),
          12.horizontalSpace,
          Expanded(
            child: Text(
              "Search doctors, specializations...",
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              AdaptiveLayout.getResponsiveFontSize(context, fontSize: 6),
            ),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: const Color(0xFF009689).withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                AdaptiveLayout.getResponsiveFontSize(context, fontSize: 8),
              ),
            ),
            child: Icon(
              Icons.tune,
              color: const Color(0xFF009689),
              size: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
