import 'package:evently_app/core/Providers/language_provider.dart';
import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(),),
      ChangeNotifierProvider(create: (_) => LanguageProvider(),),
    ],
      child: MyApp()));
}
