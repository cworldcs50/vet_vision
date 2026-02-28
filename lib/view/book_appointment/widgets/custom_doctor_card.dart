import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomDoctorCard extends StatelessWidget {
  const CustomDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      child: Column(
        children: [
          Expanded(child: Image.asset("assets/images/doctor.png")),
          Text(
            "Dr. John Doe",
            style: TextStyle(
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 25,
              ),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dentist",
              style: TextStyle(
                fontSize: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 19,
                ),
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow.shade400,
                size: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 19,
                ),
              ),
              Text(
                "4.9(156)",
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 19,
                  ),
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 25,
                ),
              ),
              Text(
                "4.1km",
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 18,
                  ),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.attach_money_outlined,
                color: Colors.grey.shade800,
                size: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 20,
                ),
              ),
              Text(
                "140",
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 20,
                  ),
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: Text(
                "Book Now",
                style: TextStyle(
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 25,
                  ),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

