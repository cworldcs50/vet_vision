import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/doctor/doctor_portal_controller.dart';
import '../../../../core/classes/adaptive_layout.dart';
import '../widgets/appointment_card_mini.dart';
import '../widgets/stat_card_doctor.dart';

class DoctorDashboardView extends GetView<DoctorPortalController> {
  const DoctorDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _WelcomeBox(),
          24.verticalSpace,
          const _StatsGrid(),
          24.verticalSpace,
          const _TodayScheduleHeader(),
          12.verticalSpace,
          const _TodayScheduleList(),
        ],
      ),
    );
  }
}

class _WelcomeBox extends GetView<DoctorPortalController> {
  const _WelcomeBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF009689), Color(0xFF00BFA5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF009689).withValues(alpha: 0.3),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Welcome back, Doctor! 🩺",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 18),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Obx(() => Text(
                "You have ${controller.todayAppointmentsCount.value} appointments scheduled for today",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 13),
                ),
              )),
        ],
      ),
    );
  }
}

class _StatsGrid extends GetView<DoctorPortalController> {
  const _StatsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      childAspectRatio: 1.6,
      children: [
        Obx(() => StatCardDoctor(
              title: "Today's Appointments",
              value: "${controller.todayAppointmentsCount.value}",
              icon: Icons.calendar_today,
              iconColor: const Color(0xFF009689),
            )),
        Obx(() => StatCardDoctor(
              title: "Total Patients",
              value: "${controller.totalPatientsCount.value}",
              icon: Icons.people_outline,
              iconColor: Colors.blue,
            )),
        Obx(() => StatCardDoctor(
              title: "This Month",
              value: "\$${controller.monthlyEarnings.value.toStringAsFixed(0)}",
              icon: Icons.attach_money,
              iconColor: Colors.green,
            )),
        Obx(() => StatCardDoctor(
              title: "Growth",
              value: "+${controller.growthPercentage.value}%",
              icon: Icons.trending_up,
              iconColor: Colors.purple,
            )),
      ],
    );
  }
}

class _TodayScheduleHeader extends StatelessWidget {
  const _TodayScheduleHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Today's Schedule",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: () => Get.find<DoctorPortalController>().selectedIndex.value = 1,
          child: Text(
            "7 appointments",
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xFF009689),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class _TodayScheduleList extends GetView<DoctorPortalController> {
  const _TodayScheduleList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final schedule = controller.todaySchedule;
      if (schedule.isEmpty) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Text("No appointments for today", style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
          ),
        );
      }
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: schedule.length,
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemBuilder: (context, index) => AppointmentCardMini(appointment: schedule[index]),
      );
    });
  }
}
