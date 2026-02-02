import 'custom_description_text.dart';
import 'custom_on_boarding_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_title_text.dart';

class CustomOnBoardingBody extends StatelessWidget {
  const CustomOnBoardingBody({
    required this.title,
    required this.description,
    required this.next,
    required this.imgPath,
    super.key,
  });

  final void Function() next;
  final String title, description, imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOnBoardingImage(imgPath: imgPath),
        SizedBox(height: 20.h),
        CustomTitle(title: title),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: CustomDescription(description: description),
        ),
        const Spacer(),
      ],
    );
  }
}
