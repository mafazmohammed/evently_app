import 'package:evently_app/core/resources/app_theme.dart';
import 'package:evently_app/core/resources/color_manager.dart';
import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/ui/screens/forget_pass/forget_pass.dart';
import 'package:evently_app/ui/screens/logIn_screen/login_screen.dart';
import 'package:evently_app/ui/screens/onboarding_screen/widgets/onboarding_content.dart';
import 'package:evently_app/ui/screens/onboarding_screen/screens/start_screen.dart';
import 'package:evently_app/ui/screens/signUp_screen/signUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/Providers/theme_provider.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,



      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.startScreenNameRoute :(context) => StartScreen(),
        RoutesManager.signUpNameRoute:(context) => SignupScreen(),
        RoutesManager.loginNameRoute:(context) => LoginScreen(),
        RoutesManager.forgetPassNameRoute:(context) => ForgetPass(),
      },
      initialRoute: RoutesManager.startScreenNameRoute,
    );
  }

}
