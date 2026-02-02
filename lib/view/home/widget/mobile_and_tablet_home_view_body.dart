import 'custom_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileAndTabletHomeViewBody extends StatelessWidget {
  const MobileAndTabletHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeContainer(
          title: "Book Appointment",
          icon: FontAwesomeIcons.calendarDays,
          subTitle: "Schedule a visit with a vet",
        ),
        15.verticalSpace,
        const CustomHomeContainer(
          title: "My Pets",
          icon: FontAwesomeIcons.dog,
          subTitle: "Manage your pets profiles",
        ),
        15.verticalSpace,
        const CustomHomeContainer(
          title: "Health Records",
          icon: FontAwesomeIcons.pills,
          subTitle: "View medical history",
        ),
      ],
    );
  }
}
