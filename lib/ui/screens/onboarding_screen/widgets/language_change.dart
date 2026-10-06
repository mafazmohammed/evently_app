import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:evently_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageChange extends StatelessWidget {
  final String languageCode;
  final String title;
  final String languageSelected;
  LanguageChange({

    required this.title,
    required this.languageCode,
    required this.languageSelected
});
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
        backgroundColor:  languageCode==languageSelected
            ?Theme.of(context).colorScheme.primary
            :Theme.of(context).colorScheme.onPrimaryContainer,
      ),
        onPressed: (){},
        child: Text(title,style: languageSelected == languageCode
            ? Theme.of(context).textTheme.labelMedium
            : Theme.of(context).textTheme.labelSmall,),
    );
  }}