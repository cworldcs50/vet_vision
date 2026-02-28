import 'custom_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MobileBookAppointment extends StatelessWidget {
  const MobileBookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) => const CustomDoctorCard(),
    );
  }
}

