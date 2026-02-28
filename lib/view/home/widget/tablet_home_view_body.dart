import 'custom_home_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TabletHomeViewBody extends StatelessWidget {
  const TabletHomeViewBody({
    super.key,
    required this.goToMyPets,
    required this.goToHealthRecords,
    required this.goToBookAppointement,
  });

  final void Function() goToMyPets;
  final void Function() goToHealthRecords;
  final void Function() goToBookAppointement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: CustomHomeContainer(
                title: "Book Appointment",
                onTap: goToBookAppointement,
                icon: FontAwesomeIcons.calendarDays,
                subTitle: "Schedule a visit with a vet",
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: CustomHomeContainer(
                title: "My Pets",
                onTap: goToMyPets,
                icon: FontAwesomeIcons.dog,
                subTitle: "Manage your pets profiles",
              ),
            ),
          ],
        ),
        50.verticalSpace,
        CustomHomeContainer(
          title: "Health Records",
          onTap: goToHealthRecords,
          icon: FontAwesomeIcons.pills,
          subTitle: "View medical history",
        ),
      ],
    );
  }
}
