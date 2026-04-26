import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/doctor_appointment_model.dart';

class AppointmentCardDetailed extends StatelessWidget {
  final DoctorAppointmentModel appointment;

  const AppointmentCardDetailed({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF009689).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        appointment.patientName[0],
                        style: TextStyle(
                          color: const Color(0xFF009689),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment.patientName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "${appointment.petName} • ${appointment.petType}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: appointment.status == "completed"
                      ? Colors.blue.withValues(alpha: 0.1)
                      : const Color(0xFF009689).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  appointment.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: appointment.status == "completed" ? Colors.blue : const Color(0xFF009689),
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              const _InfoIconText(
                icon: Icons.calendar_today_outlined,
                text: "Mar 25, 2026", // Mock date format
              ),
              20.horizontalSpace,
              _InfoIconText(
                icon: Icons.access_time,
                text: appointment.time,
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            children: [
              _InfoIconText(
                icon: appointment.isOnline ? Icons.videocam_outlined : Icons.location_on_outlined,
                text: appointment.isOnline ? "Online" : "In-Person",
              ),
              20.horizontalSpace,
              _InfoIconText(
                icon: Icons.payment,
                text: appointment.isPaid ? "Paid" : "Pay on arrival",
                textColor: appointment.isPaid ? Colors.green : Colors.orange,
              ),
            ],
          ),
          if (appointment.notes.isNotEmpty) ...[
            12.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notes:",
                    style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(
                    appointment.notes,
                    style: TextStyle(fontSize: 11.sp, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textColor;

  const _InfoIconText({required this.icon, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14.w, color: textColor ?? Colors.grey),
        6.horizontalSpace,
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: textColor ?? Colors.black54,
            fontWeight: textColor != null ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
