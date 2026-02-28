import 'package:flutter/material.dart';

class CustomOnBoardingImage extends StatelessWidget {
  const CustomOnBoardingImage({required this.imgPath, super.key});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imgPath,
      fit: BoxFit.scaleDown,
      width: MediaQuery.sizeOf(context).width / 1.5,
      height: MediaQuery.sizeOf(context).height / 3,
    );
  }
}
