import 'package:get/get.dart';
import 'custom_info_box.dart';
import 'package:flutter/material.dart';
import 'custom_order_summary_row.dart';
import 'custom_payment_method_option.dart';
import '../../../core/classes/adaptive_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/payment/payment_controller.dart';
import '../../book_appointment/widgets/custom_elevated_btn.dart';
import '../../book_appointment/widgets/custom_checkout_doctor_card.dart';

class MobilePayment extends StatelessWidget {
  const MobilePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return SingleChildScrollView(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckoutDoctorCard(
                specialty: "Session",
                price: controller.consultationFee,
                doctorName: controller.doctorName,
                imgPath: "assets/images/doctor.png",
              ),
              SizedBox(height: 24.h),
              Text(
                "Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AdaptiveLayout.getResponsiveFontSize(
                    context,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomPaymentMethodOption(
                value: "visa",
                icon: Icons.credit_card,
                title: "Pay by Visa / Card",
                subtitle: "Credit or debit card",
                groupValue: controller.selectedPaymentMethod,
                onChanged: (val) => controller.setPaymentMethod(val),
              ),
              SizedBox(height: 12.h),
              CustomPaymentMethodOption(
                value: "arrival",
                icon: Icons.money,
                title: "Pay on Arrival",
                subtitle: "Cash at the clinic",
                groupValue: controller.selectedPaymentMethod,
                onChanged: (val) => controller.setPaymentMethod(val),
              ),
              SizedBox(height: 24.h),
              if (controller.sessionType.toLowerCase() == "online")
                const CustomInfoBox(
                  icon: Icons.videocam_outlined,
                  text:
                      "Online sessions require payment by card before the consultation begins. You'll receive a video link after payment.",
                )
              else if (controller.selectedPaymentMethod == "arrival")
                const CustomInfoBox(
                  icon: Icons.info_outline,
                  text:
                      "Your appointment is reserved. Please arrive 10 minutes early and pay at the reception. Accepted: Cash or card at clinic.",
                ),
              SizedBox(height: 24.h),
              CustomOrderSummaryRow(
                title: "Consultation fee",
                value: "\$${controller.consultationFee.toStringAsFixed(0)}",
              ),
              SizedBox(height: 8.h),
              CustomOrderSummaryRow(
                title: "Service fee",
                value: "\$${controller.serviceFee.toStringAsFixed(0)}",
              ),
              SizedBox(height: 8.h),
              const Divider(),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    "\$${controller.totalAmount.toStringAsFixed(0)}",
                    style: TextStyle(
                      color: const Color(0xFF009689),
                      fontWeight: FontWeight.bold,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedBtn(
                  btnTitle:
                      controller.selectedPaymentMethod == "visa"
                          ? "Pay \$${controller.totalAmount.toStringAsFixed(0)}"
                          : "Confirm Booking",
                  onPressed: controller.confirmBooking,
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        );
      },
    );
  }
}
