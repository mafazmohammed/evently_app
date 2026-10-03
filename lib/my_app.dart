import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/ui/screens/onboarding_screen/onboarding.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.onboardingNameRoute :(context) => OnboardingScreen(),
      },
      initialRoute: RoutesManager.onboardingNameRoute,
    );
  }

}
