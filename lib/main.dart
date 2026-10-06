import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (BuildContext context)=> ThemeProvider(),
      child: MyApp()));
}
