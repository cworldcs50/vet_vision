import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/doctor/doctor_portal_controller.dart';
import '../widgets/appointment_card_detailed.dart';

class DoctorAppointmentsView extends GetView<DoctorPortalController> {
  const DoctorAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         _SearchAndFilterSection(),
        Expanded(
          child:  _AppointmentsList(),
        ),
      ],
    );
  }
}

class _SearchAndFilterSection extends GetView<DoctorPortalController> {
  const _SearchAndFilterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (v) => controller.searchQuery.value = v,
            decoration: InputDecoration(
              hintText: "Search by patient or pet name...",
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13.sp),
              prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.w),
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              const _FilterPill(title: "All"),
              12.horizontalSpace,
              const _FilterPill(title: "Upcoming"),
              12.horizontalSpace,
              const _FilterPill(title: "Completed"),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterPill extends GetView<DoctorPortalController> {
  final String title;
  const _FilterPill({required this.title});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isSelected = controller.selectedFilter.value == title;
      return GestureDetector(
        onTap: () => controller.selectedFilter.value = title,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF009689) : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }
}

class _AppointmentsList extends GetView<DoctorPortalController> {
  const _AppointmentsList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final filtered = controller.filteredAppointments;
      if (filtered.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today_outlined, size: 60.w, color: Colors.grey.shade200),
              16.verticalSpace,
              Text(
                "No appointments found",
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ],
          ),
        );
      }
      return ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: filtered.length,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) => AppointmentCardDetailed(appointment: filtered[index]),
      );
    });
  }
}
