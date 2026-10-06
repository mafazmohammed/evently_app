import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart' show AppLocalizations;

class onboardingModel{
  final String imagePath;
  final String title;
  final String description;
  const onboardingModel({
    required this.imagePath,
    required this.description,
    required this.title,
});
  //static so i can call it with the class name , not the object
  static List<onboardingModel> onboardingList(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return [
      onboardingModel(
        imagePath: "assets/images/onboarding1.png",
        title: localization.onboarding1title,
        description: localization.onboarding1desc,
      ),
      onboardingModel(
        imagePath: "assets/images/onboarding2.png",
        title: localization.onboarding2title,
        description: localization.onboarding2desc,
      ),
      onboardingModel(
        imagePath: "assets/images/onboarding3.png",
        title: localization.onboarding3title,
        description: localization.onboarding3desc,
      ),
    ];
  }
}