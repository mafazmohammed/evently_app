import 'package:evently_app/core/Providers/language_provider.dart';
import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:evently_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageChange extends StatelessWidget {
  final Locale languageCode;
  final String title;
  final Locale languageSelected;
  LanguageChange({

    required this.title,
    required this.languageCode,
    required this.languageSelected
});
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
        backgroundColor:  languageSelected == languageCode
            ?Theme.of(context).colorScheme.primary
            :Theme.of(context).colorScheme.onPrimaryContainer,
      ),
        onPressed: (){
        languageProvider.switchLanguage(languageCode);
        },
        child: Text(title,style: languageSelected == languageCode
            ? Theme.of(context).textTheme.labelMedium
            : Theme.of(context).textTheme.labelSmall,),
    );
  }}