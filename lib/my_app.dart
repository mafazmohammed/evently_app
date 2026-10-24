import 'package:evently_app/core/Providers/language_provider.dart';
import 'package:evently_app/core/resources/app_theme.dart';
import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/ui/screens/forget_pass/screens/forget_pass.dart';
import 'package:evently_app/ui/screens/logIn_screen/screens/login_screen.dart';
import 'package:evently_app/ui/screens/onboarding_screen/screens/start_screen.dart';
import 'package:evently_app/ui/screens/signUp_screen/screens/signUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/Providers/theme_provider.dart';
import 'l10n/app_localizations.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      locale: languageProvider.locale,
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      ],



      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,



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
