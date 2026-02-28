import 'tablet_home_view_body.dart';
import 'mobile_home_view_body.dart';
import 'desktop_home_view_body.dart';
import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({
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
    return AdaptiveLayout(
      mobileLayout:
          (context) => MobileHomeViewBody(
            goToMyPets: goToMyPets,
            goToHealthRecords: goToHealthRecords,
            goToBookAppointement: goToBookAppointement,
          ),
      desktopLayout:
          (context) => DesktopHomeViewBody(
            goToMyPets: goToMyPets,
            goToHealthRecords: goToHealthRecords,
            goToBookAppointement: goToBookAppointement,
          ),
      tabletLayout:
          (context) => TabletHomeViewBody(
            goToMyPets: goToMyPets,
            goToHealthRecords: goToHealthRecords,
            goToBookAppointement: goToBookAppointement,
          ),
    );
  }
}
