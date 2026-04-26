import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_additional_notes.dart';
import 'custom_date_time_selector.dart';
import 'custom_checkout_doctor_card.dart';
import 'custom_session_type_selector.dart';
import 'custom_elevated_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/book_appointment/checkout_controller.dart';

class DesktopCheckout extends GetView<CheckoutController> {
  const DesktopCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
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

            Obx(
              () => CustomSessionTypeSelector(
                selectedType: controller.selectedSessionType.value,
                onChanged: controller.setSessionType,
              ),
            ),
            SizedBox(height: 24.h),

            // Date & Time
            Obx(
              () => CustomDateTimeSelector(
                selectedSlot: controller.selectedSlot.value,
                onSlotSelected: controller.setSlot,
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
            ),
            SizedBox(height: 24.h),

            // Additional Notes
            CustomAdditionalNotes(controller: controller.notesController),
            SizedBox(height: 28.h),

            // Continue to Payment Button
            SizedBox(
              width: double.infinity,
              child: CustomElevatedBtn(
                btnTitle: "Proceed to Payment",
                onPressed: controller.proceedToPayment,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
