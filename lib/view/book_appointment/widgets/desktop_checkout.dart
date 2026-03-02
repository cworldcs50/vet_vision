import 'custom_additional_notes.dart';
import 'package:flutter/material.dart';
import 'custom_date_time_selector.dart';
import 'custom_checkout_doctor_card.dart';
import 'custom_session_type_selector.dart';
import 'custom_elevated_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesktopCheckout extends StatefulWidget {
  const DesktopCheckout({super.key});

  @override
  State<DesktopCheckout> createState() => _DesktopCheckoutState();
}

class _DesktopCheckoutState extends State<DesktopCheckout> {
  String? _selectedSlot;
  String _selectedSessionType = "online";
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCheckoutDoctorCard(
              price: 150,
              specialty: "Psychiatrist",
              doctorName: "Dr. Michael Chen",
              imgPath: "assets/images/doctor.png",
            ),
            SizedBox(height: 24.h),

            CustomSessionTypeSelector(
              selectedType: _selectedSessionType,
              onChanged: (type) => setState(() => _selectedSessionType = type),
            ),
            SizedBox(height: 24.h),

            // Date & Time
            CustomDateTimeSelector(
              selectedSlot: _selectedSlot,
              onSlotSelected: (slot) => setState(() => _selectedSlot = slot),
              dateTimeSlots: const [
                {
                  "date": "Tuesday, January 22, 2026",
                  "times": ["11:00 AM"],
                },
                {
                  "date": "Wednesday, January 21, 2026",
                  "times": ["9:00 AM", "4:00 PM"],
                },
                {
                  "date": "Friday, January 23, 2026",
                  "times": ["10:00 AM"],
                },
              ],
            ),
            SizedBox(height: 24.h),

            // Additional Notes
            CustomAdditionalNotes(controller: _notesController),
            SizedBox(height: 28.h),

            // Continue to Payment Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedBtn(
                btnTitle: "Book Appointment",
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
