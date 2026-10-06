import 'package:evently_app/core/Providers/onboarding_provider.dart';
import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/core/resources/strings_manager.dart';
import 'package:evently_app/core/reuseable_components/custom_button.dart';
import 'package:evently_app/ui/screens/onboarding_screen/widgets/language_change.dart';
import 'package:evently_app/ui/screens/onboarding_screen/widgets/start_screen_content.dart';
import 'package:evently_app/ui/screens/onboarding_screen/widgets/theme_change.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../model/onboarding_model.dart';
import '../widgets/onboarding_content.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool showOnboarding=false;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Builder(
        builder: (context) {
          final provider = context.watch<OnboardingProvider>();
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                AssetsManager.logo,
                color: Theme.of(context).colorScheme.primary,
                width: screenWidth*0.45,
              ),
              leading: provider.currentIndex == 1 || provider.currentIndex == 2
                  ?
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                    ),
                    onPressed: (){
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Icon(CupertinoIcons.back,
                      size: 24,
                      color: Theme.of(context).colorScheme.onPrimary,),
                  ),
                )
                  : null,
              actions: provider.currentIndex == 0 || provider.currentIndex == 1
                  ? [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                    backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  onPressed: (){
                    pageController.animateToPage(
                      onboardingModel.onboardingList.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Skip",style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: .w600),),
                ),
              )
              ]
                  :null,
            ),
            body: showOnboarding
                ?  onboardingContent(controller: pageController,)
                :StartScreenContent(
              onStart: () {
                setState(() {
                  showOnboarding=true;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
