import 'package:flutter/material.dart';
import 'widgets/custom_additional_notes.dart';
import 'widgets/custom_date_time_selector.dart';
import '../../core/classes/adaptive_layout.dart';
import 'widgets/custom_elevated_btn.dart';
import 'widgets/custom_session_type_selector.dart';
import 'widgets/custom_checkout_doctor_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCheckout extends StatefulWidget {
  const MobileCheckout({super.key});

  @override
  State<MobileCheckout> createState() => _MobileCheckoutState();
}

class _MobileCheckoutState extends State<MobileCheckout> {
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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
        vertical: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Card
          const CustomCheckoutDoctorCard(
            price: 150,
            specialty: "Psychiatrist",
            doctorName: "Dr. Michael Chen",
            imgPath: "assets/images/doctor.png",
          ),
          SizedBox(height: 24.h),

          // Session Type
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
              btnTitle: "Go To Payment",
              onPressed: () {},
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
