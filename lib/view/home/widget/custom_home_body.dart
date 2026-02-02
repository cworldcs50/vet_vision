import 'adaptive_home_body_layout.dart';
import 'desktop_home_view_body.dart';
import 'package:flutter/material.dart';
import 'mobile_and_tablet_home_view_body.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdaptiveLayout(
      desktopLayout: DesktopHomeViewBody(),
      mobileAndTabletLayout: MobileAndTabletHomeViewBody(),
    );
  }
}
