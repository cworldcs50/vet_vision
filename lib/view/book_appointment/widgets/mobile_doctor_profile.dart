import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/classes/adaptive_layout.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constants/images_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/book_appointment/book_appointment_controller.dart';

class MobileDoctorProfile extends GetView<BookAppointmentController> {
  const MobileDoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = DoctorModel(
      id: "0",
      price: 200,
      rating: 4.8,
      reviews: 120,
      distance: 1.2,
      name: "Dr. Michael Chen",
      specialization: "Veterinary Surgeon",
      imagePath: ImagesConstants.doctorProfile,
    );

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300.h,
              backgroundColor: const Color(0xFF009689),
              leading: IconButton(
                icon: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 16,
                    ),
                  ),
                ),
                onPressed: () => Get.back(),
              ),
              actions: [
                IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(
                      AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 10,
                      ),
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
                // 10.horizontalSpace,
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  doctor.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        color: Colors.grey.shade300,
                        child: Icon(
                          Icons.person,
                          size: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 100,
                          ),
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  doctor.name,
                                  style: TextStyle(
                                    fontSize:
                                        AdaptiveLayout.getResponsiveFontSize(
                                          context,
                                          fontSize: 22,
                                        ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: AdaptiveLayout.getResponsiveFontSize(
                                      context,
                                      fontSize: 20,
                                    ),
                                  ),
                                  4.horizontalSpace,
                                  Text(
                                    "${doctor.rating}",
                                    style: TextStyle(
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 14,
                                          ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " (${doctor.reviews})",
                                    style: TextStyle(
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 14,
                                          ),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Text(
                            doctor.specialization,
                            style: TextStyle(
                              fontSize: AdaptiveLayout.getResponsiveFontSize(
                                context,
                                fontSize: 14,
                              ),
                              color: const Color(0xFF009689),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          15.verticalSpace,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                  AdaptiveLayout.getResponsiveFontSize(
                                    context,
                                    fontSize: 10,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF009689,
                                  ).withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.people,
                                  color: const Color(0xFF009689),
                                  size: AdaptiveLayout.getResponsiveFontSize(
                                    context,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              5.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Patients",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "1,000+",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              30.horizontalSpace,
                              Container(
                                padding: EdgeInsets.all(
                                  AdaptiveLayout.getResponsiveFontSize(
                                    context,
                                    fontSize: 10,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF009689,
                                  ).withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.work,
                                  color: const Color(0xFF009689),
                                  size: AdaptiveLayout.getResponsiveFontSize(
                                    context,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Experience",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    "8 Years",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          AdaptiveLayout.getResponsiveFontSize(
                                            context,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          20.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Obx(
                              () => Row(
                                children: [
                                  CustomTabItem(
                                    index: 0,
                                    title: "About",
                                    changeTab: () => controller.changeTab(0),
                                    selectedIndex:
                                        controller.selectedTabIndex.value,
                                  ),
                                  CustomTabItem(
                                    index: 1,
                                    title: "Sessions",
                                    changeTab: () => controller.changeTab(1),
                                    selectedIndex:
                                        controller.selectedTabIndex.value,
                                  ),
                                  CustomTabItem(
                                    index: 2,
                                    title: "Reviews",
                                    changeTab: () => controller.changeTab(2),
                                    selectedIndex:
                                        controller.selectedTabIndex.value,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Obx(() {
                            if (controller.selectedTabIndex.value == 0) {
                              return Text(
                                "Dr. Michael Chen is a highly experienced Veterinary Surgeon with over 8 years of practice. He specializes in advanced surgical procedures and provides compassionate care for all his patients. His state-of-the-art clinic is equipped to handle both routine and complex cases.",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize:
                                      AdaptiveLayout.getResponsiveFontSize(
                                        context,
                                        fontSize: 14,
                                      ),
                                  height: 1.5,
                                ),
                              );
                            } else if (controller.selectedTabIndex.value == 1) {
                              return Column(
                                children: [
                                  const CustomSessionCard(
                                    type: "Online",
                                    price: "\$40.00",
                                    title: "Session Consultation",
                                  ),

                                  15.verticalSpace,
                                  const CustomSessionCard(
                                    price: "\$80.00",
                                    type: "In-Person",
                                    title: "Physical Examination",
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: Text("Reviews coming soon"),
                              );
                            }
                          }),
                          100.verticalSpace, // Padding for bottom bar
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Bottom Fixed Bar
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF009689).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: const Icon(Icons.chat, color: Color(0xFF009689)),
                ),
                15.horizontalSpace,
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.bookAppointment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF009689),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Book Appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSessionCard extends StatelessWidget {
  const CustomSessionCard({
    super.key,
    required this.price,
    required this.title,
    required this.type,
  });

  final String title;
  final String type;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AdaptiveLayout.getResponsiveFontSize(context, fontSize: 15),
        ),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(
                  AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF009689).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10),
                  ),
                ),
                child: Icon(
                  type == "Online" ? Icons.videocam : Icons.person,
                  color: const Color(0xFF009689),
                ),
              ),
              15.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    type,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            price,
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
    );
  }
}

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({
    super.key,
    required this.index,
    required this.title,
    required this.changeTab,
    required this.selectedIndex,
  });

  final String title;
  final int index, selectedIndex;
  final void Function() changeTab;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: changeTab,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color:
                selectedIndex == index
                    ? const Color(0xFF009689)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.grey,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.w500,
              fontSize: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
