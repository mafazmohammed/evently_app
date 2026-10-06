import 'package:evently_app/ui/screens/onboarding_screen/widgets/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/Providers/theme_provider.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/reuseable_components/custom_button.dart';
import 'language_change.dart';

class StartScreenContent extends StatelessWidget{
  final String languageSelected="en";
  final VoidCallback onStart;
  const StartScreenContent({
    required this.onStart
});
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AssetsManager.beingCreative,
            color: Theme.of(context).colorScheme.onPrimary,
            height: screenHeight*0.48,
            fit: .contain,
          ),
          SizedBox(height: 24,),
          Text(
            StringsManager.startTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8,),
          Text(
            StringsManager.startDesc,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Text(StringsManager.language,style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 18,
                  fontWeight: .w500
              ),),
              Spacer(),
              LanguageChange( title: "English",languageCode: "en",languageSelected: languageSelected,),
              SizedBox(width: 8,),
              LanguageChange(title: "Arabic",languageCode: "ar",languageSelected: languageSelected,),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              Text(StringsManager.theme,style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 18,
                  fontWeight: .w500
              ),),
              Spacer(),
              ThemeChange(iconPath: provider.themeMode==ThemeMode.light ?AssetsManager.sunSelected : AssetsManager.sun, mode: ThemeMode.light),
              SizedBox(width: 8,),
              ThemeChange(iconPath: provider.themeMode == ThemeMode.dark ? AssetsManager.moonSelected : AssetsManager.moon, mode: ThemeMode.dark),
            ],
          ),
          SizedBox(height: 24,),
          CustomButton(title:StringsManager.startActionTitle,onClicked: onStart,)
        ],
      ),
    );
  }

}