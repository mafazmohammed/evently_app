import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../model/onboarding_model.dart';

class OnboardingSlider extends StatelessWidget{
  final PageController controller;
  const OnboardingSlider({
    super.key,
    required this.controller
});
  @override
  Widget build(BuildContext context) {
    final onboardingList = onboardingModel.onboardingList(context);
    return SmoothPageIndicator(
      controller: controller,
      count: onboardingList.length,
      effect: ExpandingDotsEffect(
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotColor: Theme.of(context).colorScheme.onSurface,
        dotWidth: 10,
        dotHeight: 8,
        radius: 36,
      ),
    );
  }

}