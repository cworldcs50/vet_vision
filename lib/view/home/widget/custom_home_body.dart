import 'package:flutter/material.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'mobile_home_view_body.dart';
import 'tablet_home_view_body.dart';
import 'desktop_home_view_body.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: (context) => const MobileHomeViewBody(),
      tabletLayout:
          (context) =>
              const TabletHomeViewBody(), // We'll just proxy these to Mobile for now
      desktopLayout:
          (context) =>
              const DesktopHomeViewBody(), // We'll just proxy these to Mobile for now
    );
  }
}
