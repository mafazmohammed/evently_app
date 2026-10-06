import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  Locale locale = const Locale('en');

  void switchLanguage(Locale newLocale) {
    if (locale == newLocale) return;

    locale = newLocale;
    notifyListeners();
  }
}