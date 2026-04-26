import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/auth/auth_controller.dart';
import '../../core/classes/adaptive_layout.dart';
import '../auth/widgets/custom_text_form_field.dart';
import '../auth/widgets/custom_auth_button.dart';

class DoctorRegistrationView extends GetView<AuthController> {
  const DoctorRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009689),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          const _RegistrationHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              padding: EdgeInsets.all(24.w),
              child: PageView(
                controller: controller.doctorRegistrationPageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  _Step1PersonalInfo(),
                  _Step2ProfessionalDetails(),
                  _Step3PracticeDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegistrationHeader extends GetView<AuthController> {
  const _RegistrationHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.medical_services_outlined,
              color: Colors.white,
              size: 40.w,
            ),
          ),
          10.verticalSpace,
          Text(
            "Join as a Doctor",
            style: TextStyle(
              color: Colors.white,
              fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 24),
              fontWeight: FontWeight.bold,
            ),
          ),
          5.verticalSpace,
          Obx(() => Text(
            "Step ${controller.currentDoctorStep.value} of 3",
            style: TextStyle(
              color: Colors.white70,
              fontSize: AdaptiveLayout.getResponsiveFontSize(context, fontSize: 14),
            ),
          )),
          15.verticalSpace,
          const _StepIndicator(),
        ],
      ),
    );
  }
}

class _StepIndicator extends GetView<AuthController> {
  const _StepIndicator();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Obx(() {
          bool isActive = controller.currentDoctorStep.value > index;
          return Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.white24,
              borderRadius: BorderRadius.circular(2.r),
            ),
          );
        });
      }),
    );
  }
}

class _Step1PersonalInfo extends GetView<AuthController> {
  const _Step1PersonalInfo();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.doctorStep1FormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StepTitle(title: "Personal Information", subtitle: "Let's start with your basic details"),
            20.verticalSpace,
            CustomTextFormField(
              hint: "Dr. John Smith",
              label: "Full Name",
              prefixIcon: Icons.person_outline,
              controller: controller.fullNameController,
              validator: controller.fullNameValidator,
            ),
            16.verticalSpace,
            CustomTextFormField(
              hint: "doctor@example.com",
              label: "Email Address",
              prefixIcon: Icons.email_outlined,
              controller: controller.emailController,
              validator: controller.emailValidator,
            ),
            16.verticalSpace,
            CustomTextFormField(
              hint: "+1 (555) 123-4567",
              label: "Phone Number",
              prefixIcon: Icons.phone_outlined,
              controller: controller.phoneController,
              validator: controller.phoneValidator,
            ),
            16.verticalSpace,
            GetBuilder<AuthController>(
              builder: (c) => CustomTextFormField(
                hint: "********",
                label: "Password",
                prefixIcon: Icons.lock_outline,
                obscureText: c.showPassword,
                onPressed: c.visiblePassword,
                suffixIcon: c.showPasswordSuffixIcon,
                controller: controller.passwordController,
                validator: controller.passwordValidator,
              ),
            ),
            16.verticalSpace,
            GetBuilder<AuthController>(
              builder: (c) => CustomTextFormField(
                hint: "********",
                label: "Confirm Password",
                prefixIcon: Icons.lock_outline,
                obscureText: c.showConfirmedPassword,
                onPressed: c.visibleConfirmedPassword,
                suffixIcon: c.showConfirmedPasswordSuffixIcon,
                controller: controller.confirmedPasswordController,
                validator: controller.confirmedPasswordValidator,
              ),
            ),
            30.verticalSpace,
            CustomAuthButton(
              onPressed: () => controller.nextStep(),
              backgroundColor: const Color(0xFF009689),
              child: const Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            16.verticalSpace,
            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                    children: const [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(color: Color(0xFF009689), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Step2ProfessionalDetails extends GetView<AuthController> {
  const _Step2ProfessionalDetails();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.doctorStep2FormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StepTitle(title: "Professional Details", subtitle: "Tell us about your veterinary expertise"),
            20.verticalSpace,
            CustomTextFormField(
              hint: "e.g., Small Animal Internist",
              label: "Specialization",
              prefixIcon: Icons.psychology_outlined,
              controller: controller.specializationController,
              validator: (v) => controller.commonValidator(v, "Specialization"),
            ),
            16.verticalSpace,
            CustomTextFormField(
              hint: "e.g., 10",
              label: "Years of Experience",
              prefixIcon: Icons.work_history_outlined,
              keyboardType: TextInputType.number,
              controller: controller.experienceController,
              validator: (v) => controller.commonValidator(v, "Experience"),
            ),
            16.verticalSpace,
            CustomTextFormField(
              hint: "VET-123456",
              label: "License Number",
              prefixIcon: Icons.badge_outlined,
              controller: controller.licenseController,
              validator: (v) => controller.commonValidator(v, "License Number"),
            ),
            16.verticalSpace,
            CustomTextFormField(
              hint: "Tell us about your experience...",
              label: "About You",
              prefixIcon: Icons.description_outlined,
              maxLines: 4,
              controller: controller.bioController,
              validator: (v) => controller.commonValidator(v, "Bio"),
            ),
            20.verticalSpace,
            Text("Profile Picture", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
            8.verticalSpace,
            GetBuilder<AuthController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () => controller.pickImage(),
                  child: Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: controller.profileImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              File(controller.profileImage!.path),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_outlined, size: 40.w, color: Colors.grey),
                              Text("Upload profile picture", style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                              Text("(PNG, JPG up to 5MB)", style: TextStyle(color: Colors.grey.shade400, fontSize: 10.sp)),
                            ],
                          ),
                  ),
                );
              },
            ),
            30.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => controller.previousStep(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: const BorderSide(color: Color(0xFF009689)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: const Text("Back", style: TextStyle(color: Color(0xFF009689))),
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: CustomAuthButton(
                    onPressed: () => controller.nextStep(),
                    backgroundColor: const Color(0xFF009689),
                    child: const Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Step3PracticeDetails extends GetView<AuthController> {
  const _Step3PracticeDetails();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.doctorStep3FormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StepTitle(title: "Practice Details", subtitle: "Set up your consultation preferences"),
            20.verticalSpace,
            CustomTextFormField(
              hint: "\$ e.g., 50",
              label: "Session Cost (USD)",
              prefixIcon: Icons.attach_money,
              keyboardType: TextInputType.number,
              controller: controller.sessionCostController,
              validator: (v) => controller.commonValidator(v, "Session Cost"),
            ),
            20.verticalSpace,
            Text("Consultation Types *", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
            8.verticalSpace,
            Obx(() => _ConsultationTypeTile(
              title: "Online Consultation",
              subtitle: "Video/phone consultations",
              value: controller.isOnlineConsultation.value,
              onChanged: (v) => controller.isOnlineConsultation.value = v!,
            )),
            Obx(() => _ConsultationTypeTile(
              title: "In-Person Consultation",
              subtitle: "At your clinic location",
              value: controller.isInPersonConsultation.value,
              onChanged: (v) => controller.isInPersonConsultation.value = v!,
            )),
            16.verticalSpace,
            CustomTextFormField(
              hint: "Enter your clinic address",
              label: "Clinic Address *",
              prefixIcon: Icons.location_on_outlined,
              controller: controller.clinicAddressController,
              validator: (v) => controller.commonValidator(v, "Clinic Address"),
            ),
            20.verticalSpace,
            Obx(() => CheckboxListTile(
              value: controller.termsAccepted.value,
              onChanged: (v) => controller.termsAccepted.value = v!,
              title: Text(
                "I agree to the Terms and Conditions and Privacy Policy. I confirm that all information provided is accurate and I hold valid veterinary credentials.",
                style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: const Color(0xFF009689),
            )),
            30.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => controller.previousStep(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: const BorderSide(color: Color(0xFF009689)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: const Text("Back", style: TextStyle(color: Color(0xFF009689))),
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: CustomAuthButton(
                    onPressed: () => controller.completeDoctorRegistration(),
                    backgroundColor: const Color(0xFF009689),
                    child: const Text("Complete Registration", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StepTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _StepTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        4.verticalSpace,
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class _ConsultationTypeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _ConsultationTypeTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: value ? const Color(0xFF009689) : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.r),
        color: value ? const Color(0xFFE0F2F1) : Colors.transparent,
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: 12.sp)),
        activeColor: const Color(0xFF009689),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
