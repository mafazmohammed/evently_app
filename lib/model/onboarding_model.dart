import '../core/resources/strings_manager.dart';

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
  static const List<onboardingModel> onboardingList =[
    onboardingModel(imagePath: "assets/images/onboarding1.png", description: StringsManager.onboarding1desc, title: StringsManager.onboarding1title),
    onboardingModel(imagePath: "assets/images/onboarding2.png", description: StringsManager.onboarding2desc, title: StringsManager.onboarding2title),
    onboardingModel(imagePath: "assets/images/onboarding3.png", description: StringsManager.onboarding3desc, title: StringsManager.onboarding3title),
  ];
}