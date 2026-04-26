import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/bookings/bookings_controller.dart';
import '../../core/classes/adaptive_layout.dart';
import '../../core/theme/app_colors.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text(
          "My Bookings",
          style: TextStyle(
            color: Colors.black,
            fontSize: AdaptiveLayout.getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<BookingsController>(
        builder: (controller) {
          bool isSelected = controller.selectedTabIndex == 0;
          return Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 16,
                  ),
                  vertical: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 8,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 12,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.primaryColor
                                    : Colors.grey[100],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              "Upcoming",
                              style: TextStyle(
                                color:
                                    isSelected
                                        ? Colors.white
                                        : Colors.grey[700],
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changeTab(1),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color:
                                !isSelected
                                    ? AppColors.primaryColor
                                    : Colors.grey[100],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Text(
                              "Past",
                              style: TextStyle(
                                color:
                                    !isSelected
                                        ? Colors.white
                                        : Colors.grey[700],
                                fontWeight:
                                    !isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    controller.selectedTabIndex == 0
                        ? ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                            vertical: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 20,
                            ),
                          ),
                          itemCount: 2,
                          separatorBuilder:
                              (context, index) => 20.verticalSpace,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.r,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withValues(alpha: 0.05),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Oct 24, 2026",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 4,
                                              ),
                                          horizontal:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 12,
                                              ),
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              "Upcoming" == "Upcoming"
                                                  ? AppColors.primaryColor
                                                      .withValues(alpha: 0.1)
                                                  : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Text(
                                          "Upcoming",
                                          style: TextStyle(
                                            color:
                                                "Upcoming" == "Upcoming"
                                                    ? AppColors.primaryColor
                                                    : Colors.grey[700],
                                            fontSize:
                                                AdaptiveLayout.getResponsiveFontSize(
                                                  context,
                                                  fontSize: 12,
                                                ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: AppColors.primaryColor
                                            .withValues(alpha: 0.2),
                                        child: Icon(
                                          Icons.person,
                                          color: AppColors.primaryColor,
                                          size:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 24,
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Dr. Michael Chen",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  AdaptiveLayout.getResponsiveFontSize(
                                                    context,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            "Psychiatrist",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize:
                                                  AdaptiveLayout.getResponsiveFontSize(
                                                    context,
                                                    fontSize: 12,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  const Divider(),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size:
                                            AdaptiveLayout.getResponsiveFontSize(
                                              context,
                                              fontSize: 16,
                                            ),
                                        color: Colors.grey[600],
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "10:00 AM",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const Spacer(),
                                      if ("Upcoming" == "Upcoming")
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor:
                                                AppColors.primaryColor,
                                            side: const BorderSide(
                                              color: AppColors.primaryColor,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          child: const Text("Reschedule"),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                        : ListView.separated(
                          itemCount: 3,
                          padding: EdgeInsets.symmetric(
                            horizontal: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                            vertical: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                          ),
                          separatorBuilder:
                              (context, index) => 20.verticalSpace,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10.r,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withValues(alpha: 0.05),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sep 12, 2026",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 14,
                                              ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              "Completed" == "Upcoming"
                                                  ? AppColors.primaryColor
                                                      .withValues(alpha: 0.1)
                                                  : Colors.grey[200],
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        child: Text(
                                          "Completed",
                                          style: TextStyle(
                                            color:
                                                "Completed" == "Upcoming"
                                                    ? AppColors.primaryColor
                                                    : Colors.grey[700],
                                            fontSize:
                                                AdaptiveLayout.getResponsiveFontSize(
                                                  context,
                                                  fontSize: 12,
                                                ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  25.verticalSpace,
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius:
                                            AdaptiveLayout.getResponsiveFontSize(
                                              context,
                                              fontSize: 20,
                                            ),
                                        backgroundColor: AppColors.primaryColor
                                            .withValues(alpha: 0.2),
                                        child: Icon(
                                          Icons.person,
                                          color: AppColors.primaryColor,
                                          size:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 20,
                                              ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Dr. Ahmed Hassan",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  AdaptiveLayout.getResponsiveFontSize(
                                                    context,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            "Internist",
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize:
                                                  AdaptiveLayout.getResponsiveFontSize(
                                                    context,
                                                    fontSize: 12,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // const Spacer(flex: 2),
                                  12.verticalSpace,
                                  const Divider(),
                                  8.verticalSpace,
                                  // const Spacer(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size:
                                            AdaptiveLayout.getResponsiveFontSize(
                                              context,
                                              fontSize: 16,
                                            ),
                                        color: Colors.grey[600],
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "02:00 PM",
                                        style: TextStyle(
                                          fontSize:
                                              AdaptiveLayout.getResponsiveFontSize(
                                                context,
                                                fontSize: 12,
                                              ),
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const Spacer(),
                                      if ("Completed" == "Upcoming")
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor:
                                                AppColors.primaryColor,
                                            side: const BorderSide(
                                              color: AppColors.primaryColor,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                AdaptiveLayout.getResponsiveFontSize(
                                                  context,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Reschedule",
                                            style: TextStyle(
                                              fontSize:
                                                  AdaptiveLayout.getResponsiveFontSize(
                                                    context,
                                                    fontSize: 12,
                                                  ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String date;
  final String doctorName;
  final String specialization;
  final String time;
  final String status;

  const BookingCard({
    super.key,
    required this.date,
    required this.doctorName,
    required this.specialization,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isUpcoming = status == "Upcoming";

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.r,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 4,
                  ),
                  horizontal: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 12,
                  ),
                ),
                decoration: BoxDecoration(
                  color:
                      isUpcoming
                          ? AppColors.primaryColor.withValues(alpha: .1)
                          : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color:
                        isUpcoming ? AppColors.primaryColor : Colors.grey[700],
                    fontWeight: FontWeight.w600,
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const Spacer(flex: 2),

          /// Doctor Info
          Row(
            children: [
              CircleAvatar(
                radius: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 20,
                ),
                backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
                child: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                  size: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 22,
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      specialization,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Spacer(flex: 2),

          const Divider(),

          const Spacer(),

          Row(
            children: [
              Icon(
                Icons.access_time,
                color: Colors.grey[600],
                size: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 12,
                  ),
                ),
              ),

              const Spacer(),

              if (isUpcoming)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    side: const BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    "Reschedule",
                    style: TextStyle(
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
