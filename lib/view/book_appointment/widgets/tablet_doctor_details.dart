import 'package:flutter/material.dart';
import 'custom_doctor_image.dart';
import 'custom_doctor_name_and_price.dart';
import 'custom_book_appointement_btn.dart';
import 'custom_doctor_specialty_text.dart';
import 'custom_available_appointments.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletDoctorDetails extends StatelessWidget {
  const TabletDoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDoctorImage(imgPath: "assets/images/doctor.png"),

            SizedBox(height: 16.h),

            const CustomDoctorNameAndPrice(
              doctorName: "Dr. Michael Chen",
              price: 200,
            ),

            SizedBox(height: 4.h),

            const CustomDoctorSpecialtyText(specialty: "Phs"),

            SizedBox(height: 8.h),

            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "4.3",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 12,
                    ),
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "(120 reviews)",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 12,
                    ),
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.work_outline,
                  color: Colors.grey,
                  size: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  "15 yrs experience",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 12,
                    ),
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey,
                  size: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  "1.2km away",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 12,
                    ),
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Row(
              children: [
                // Online Sessions — outlined
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 14,
                    ),

                    vertical: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 6,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.videocam_outlined,
                        size:
                            AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 11,
                            ) +
                            2,
                        color: AppColors.primaryColor,
                      ),
                      // SizedBox(width: 4.w),
                      Text(
                        "Online Sessions",
                        style: TextStyle(
                          fontSize: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 11,
                          ),
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                // In-Person Sessions — filled
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 14,
                    ),

                    vertical: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 6,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_outline,
                        size:
                            AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 11,
                            ) +
                            2,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "In-Person Sessions",
                        style: TextStyle(
                          fontSize: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 11,
                          ),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 16,
                    ),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Expert in mood disorders, ADHD, and medication management. Holistic approach to mental wellness.",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 13,
                    ),
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call_outlined,
                      size: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                    ),
                    label: Text(
                      "Call",
                      style: TextStyle(
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      size: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                    ),
                    label: Text(
                      "Chat",
                      style: TextStyle(
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 18,
                      ),
                      color: Colors.black,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "Available Appointments",
                      style: TextStyle(
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                const CustomAvailableAppointments(
                  crossAxisCount: 3,
                  appointments: [
                    {"day": "Tuesday, Jan 21", "time": "11:00 AM"},
                    {"day": "Wednesday, Jan 21", "time": "9:00 AM"},
                    {"day": "Wednesday, Jan 21", "time": "4:00 PM"},
                    {"day": "Friday, Jan 23", "time": "10:00 AM"},
                  ],
                ),
              ],
            ),

            SizedBox(height: 20.h),

            SizedBox(
              width: double.infinity,
              child: CustomBookAppointementBtn(onPressed: () {}),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
