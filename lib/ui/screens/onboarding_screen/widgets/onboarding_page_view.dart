import 'package:evently_app/core/Providers/onboarding_provider.dart';
import 'package:evently_app/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPageView extends StatelessWidget{
  final PageController controller;
  const OnboardingPageView({super.key , required this.controller});
  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: controller,
      itemCount: onboardingModel.onboardingList.length,
      onPageChanged: (index) {
        context.read<OnboardingProvider>().onPageChanged(index);
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onboardingModel.onboardingList[index].imagePath,
              color: Theme.of(context).colorScheme.onPrimary,
              height:MediaQuery.of(context).size.height * 0.48,
              fit: .contain,
            ),
          ],
        );
      },
    );
  }

}