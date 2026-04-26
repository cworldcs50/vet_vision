import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/doctor/doctor_portal_controller.dart';
import '../../../auth/widgets/custom_auth_button.dart';

class DoctorProfileView extends GetView<DoctorPortalController> {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ProfileImageHeader(),
          24.verticalSpace,
          _ProfileSection(
            title: "Basic Information",
            children: [
              _ProfileField(label: "Full Name", textController: controller.fullNameController),
              _ProfileField(label: "Email Address", textController: controller.emailController, keyboardType: TextInputType.emailAddress),
              _ProfileField(label: "Phone Number", textController: controller.phoneController, keyboardType: TextInputType.phone),
              _ProfileField(label: "Specialization", textController: controller.specializationController),
              _ProfileField(label: "Years of Experience", textController: controller.experienceController, keyboardType: TextInputType.number),
              _ProfileField(label: "License Number", textController: controller.licenseController),
              _ProfileField(label: "Bio", textController: controller.bioController, maxLines: 3),
            ],
          ),
          24.verticalSpace,
          _ProfileSection(
            title: "Session Settings",
            children: [
              _ProfileField(label: "Session Cost (USD)", textController: controller.sessionCostController, keyboardType: TextInputType.number),
              const _ConsultationToggleSection(),
            ],
          ),
          24.verticalSpace,
          const _ProfileSection(
            title: "Available Time Slots",
            children: [
              _TimeSlotPickerMock(),
            ],
          ),
          32.verticalSpace,
          CustomAuthButton(
            onPressed: () {
              Get.snackbar("Success", "Profile updated successfully", backgroundColor: Colors.green, colorText: Colors.white);
            },
            backgroundColor: const Color(0xFF009689),
            child: const Text("Save Changes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          40.verticalSpace,
        ],
      ),
    );
  }
}

class _ProfileImageHeader extends StatelessWidget {
  const _ProfileImageHeader();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF009689), width: 2),
            ),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: const NetworkImage(
                "https://raw.githubusercontent.com/flutter/website/master/examples/layout/lakes/step5/images/lake.jpg", // Placeholder
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: const BoxDecoration(
                color: Color(0xFF009689),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 16.w),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ProfileSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        12.verticalSpace,
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class _ProfileField extends GetView<DoctorPortalController> {
  final String label;
  final TextEditingController textController;
  final TextInputType? keyboardType;
  final int maxLines;

  const _ProfileField({
    required this.label,
    required this.textController,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.black54),
          ),
          8.verticalSpace,
          TextField(
            controller: textController,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            ),
            style: TextStyle(fontSize: 14.sp, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class _ConsultationToggleSection extends GetView<DoctorPortalController> {
  const _ConsultationToggleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => _ToggleRow(
              title: "Online Consultation",
              value: controller.isOnlineConsultation.value,
              onChanged: (v) => controller.isOnlineConsultation.value = v,
            )),
        12.verticalSpace,
        Obx(() => _ToggleRow(
              title: "In-Person Consultation",
              value: controller.isInPersonConsultation.value,
              onChanged: (v) => controller.isInPersonConsultation.value = v,
            )),
      ],
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleRow({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 14.sp, color: Colors.black87)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF009689),
        ),
      ],
    );
  }
}

class _TimeSlotPickerMock extends StatelessWidget {
  const _TimeSlotPickerMock();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child:  _MockDropdown(label: "Available from day", value: "Monday"),
            ),
            12.horizontalSpace,
            const Expanded(
              child:  _MockDropdown(label: "Until", value: "Friday"),
            ),
          ],
        ),
        16.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xFF009689),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              "+ Add Time Slot",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.sp),
            ),
          ),
        ),
      ],
    );
  }
}

class _MockDropdown extends StatelessWidget {
  final String label;
  final String value;

  const _MockDropdown({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
        4.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: TextStyle(fontSize: 13.sp, color: Colors.black87)),
              Icon(Icons.keyboard_arrow_down, size: 16.w, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
