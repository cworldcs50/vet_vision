import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/classes/adaptive_layout.dart';
import '../../../controller/home/home_controller.dart';
import 'custom_home_header.dart';
import 'custom_search_bar.dart';
import 'custom_home_categories.dart';
import 'custom_special_offer_banner.dart';
import 'custom_doctor_card.dart';

class MobileHomeViewBody extends GetView<HomeController> {
  const MobileHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(
              AdaptiveLayout.getResponsiveFontSize(context, fontSize: 20),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF009689),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10),
                ),
                bottomRight: Radius.circular(
                  AdaptiveLayout.getResponsiveFontSize(context, fontSize: 10),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHomeHeader(),
                20.verticalSpace,
                const CustomSearchBar(),
              ],
            ),
          ),
          20.verticalSpace,
          const CustomHomeCategories(),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 20,
              ),
            ),
            child: const CustomSpecialOfferBanner(),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 20,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Doctors (${controller.allDoctors.length})",
                  style: TextStyle(
                    fontSize: AdaptiveLayout.getResponsiveFontSize(
                      context,
                      fontSize: 18,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all >",
                    style: TextStyle(
                      color: const Color(0xFF009689),
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 13,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.verticalSpace,
          ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 20,
              ),
              vertical: AdaptiveLayout.getResponsiveFontSize(
                context,
                fontSize: 10,
              ),
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.allDoctors.length,
            separatorBuilder: (context, index) => 15.verticalSpace,
            itemBuilder: (context, index) {
              final doctor = controller.allDoctors[index];
              return CustomDoctorCard(doctor: doctor);
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
