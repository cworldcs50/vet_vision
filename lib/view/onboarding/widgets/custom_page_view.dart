import 'package:flutter/material.dart';
import '../../../data/datasource/static/on_boarding_data.dart';
import 'onboarding_body.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.next,
  });

  final PageController pageController;
  final void Function(int) onPageChanged;
  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: kOnBoardingData.length,
      physics: const ClampingScrollPhysics(),
      scrollBehavior: const ScrollBehavior(),
      controller: pageController,

      onPageChanged: (index) => onPageChanged(index),
      itemBuilder:
          (context, index) => Center(
            child: CustomOnBoardingBody(
              next: next,
              title: kOnBoardingData[index].title,
              imgPath: kOnBoardingData[index].imgUrl,
              description: kOnBoardingData[index].description,
            ),
          ),
    );
  }
}
