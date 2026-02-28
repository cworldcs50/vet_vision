import 'custom_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DesktopHomeViewBody extends StatelessWidget {
  const DesktopHomeViewBody({
    super.key,
    required this.goToBookAppointement,
    required this.goToHealthRecords,
    required this.goToMyPets,
  });

  final void Function() goToMyPets;
  final void Function() goToHealthRecords;
  final void Function() goToBookAppointement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomHomeContainer(
            title: "Book Appointment",
            onTap: goToBookAppointement,
            icon: FontAwesomeIcons.calendarDays,
            subTitle: "Schedule a visit with a vet",
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomHomeContainer(
            title: "My Pets",
            onTap: goToMyPets,
            icon: FontAwesomeIcons.dog,
            subTitle: "Manage your pets profiles",
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomHomeContainer(
            title: "Health Records",
            onTap: goToHealthRecords,
            icon: FontAwesomeIcons.pills,
            subTitle: "View medical history",
          ),
        ),
      ],
    );
  }
}
