import 'package:get/get.dart';
import 'widget/custom_home_body.dart';
import '../profile/profile_view.dart';
import 'package:flutter/material.dart';
import '../bookings/bookings_view.dart';
import '../messages/messages_view.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          switch (controller.currentNavIndex) {
            case 0:
              return const CustomHomeBody();
            case 1:
              return const BookingsView();
            case 2:
              return const MessagesView();
            case 3:
              return const ProfileView();
            default:
              return const CustomHomeBody();
          }
        },
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) {
          return BottomNavigationBar(
            currentIndex: controller.currentNavIndex,
            onTap: controller.changeNavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF009689),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 10,
              ),
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 10,
              ),
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined),
                activeIcon: Icon(Icons.calendar_today),
                label: "Bookings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                activeIcon: Icon(Icons.message),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
