import 'custom_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileHomeViewBody extends StatelessWidget {
  const MobileHomeViewBody({
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
    return Column(
      children: [
        CustomHomeContainer(
          onTap: goToBookAppointement,
          title: "Book Appointment",
          icon: FontAwesomeIcons.calendarDays,
          subTitle: "Schedule a visit with a vet",
        ),
        15.verticalSpace,
        CustomHomeContainer(
          onTap: goToMyPets,
          title: "My Pets",
          icon: FontAwesomeIcons.dog,
          subTitle: "Manage your pets profiles",
        ),
        15.verticalSpace,
        CustomHomeContainer(
          onTap: goToHealthRecords,
          title: "Health Records",
          icon: FontAwesomeIcons.pills,
          subTitle: "View medical history",
        ),
      ],
    );
  }
}
