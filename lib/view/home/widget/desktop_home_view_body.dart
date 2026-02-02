import 'custom_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopHomeViewBody extends StatelessWidget {
  const DesktopHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomHomeContainer(
          title: "Book Appointment",
          icon: FontAwesomeIcons.calendarDays,
          subTitle: "Schedule a visit with a vet",
        ),
        15.horizontalSpace,
        const CustomHomeContainer(
          title: "My Pets",
          icon: FontAwesomeIcons.dog,
          subTitle: "Manage your pets profiles",
        ),
        15.horizontalSpace,
        const CustomHomeContainer(
          title: "Health Records",
          icon: FontAwesomeIcons.pills,
          subTitle: "View medical history",
        ),
      ],
    );
  }
}
