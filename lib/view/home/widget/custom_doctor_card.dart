import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/classes/adaptive_layout.dart';

class CustomDoctorCard extends GetView<HomeController> {
  final DoctorModel doctor;

  const CustomDoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToDoctorProfile(doctor),
      child: Container(
        padding: EdgeInsets.all(
          AdaptiveLayout.getResponsiveFontSize(context, fontSize: 5),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            AdaptiveLayout.getResponsiveFontSize(context, fontSize: 20),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AdaptiveLayout.getResponsiveFontSize(context, fontSize: 16),
              ),
              child: Image.asset(
                doctor.imagePath,
                width: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 80,
                ),
                height: AdaptiveLayout.getResponsiveFontSize(
                  context,
                  fontSize: 80,
                ),
                fit: BoxFit.cover,
              ),
            ),
            // 12.horizontalSpace,
            Expanded(
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
                            fontSize: AdaptiveLayout.getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Text(
                    doctor.specialization,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: AdaptiveLayout.getResponsiveFontSize(
                        context,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  8.verticalSpace,
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        "${doctor.rating} (${doctor.reviews})",
                        style: TextStyle(
                          fontSize: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 12,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      12.horizontalSpace,
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade400,
                        size: AdaptiveLayout.getResponsiveFontSize(
                          context,
                          fontSize: 16,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        "${doctor.distance} km",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: AdaptiveLayout.getResponsiveFontSize(
                            context,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
