import 'custom_title_text.dart';
import 'custom_description_text.dart';
import 'custom_on_boarding_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBoardingBody extends StatelessWidget {
  const CustomOnBoardingBody({
    super.key,
    required this.next,
    required this.title,
    required this.imgPath,
    required this.description,
  });

  final void Function() next;
  final String title, description, imgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomOnBoardingImage(imgPath: imgPath),
        15.verticalSpace,
        CustomTitle(title: title),
        15.verticalSpace,
        CustomDescription(description: description),
      ],
    );
  }
}
