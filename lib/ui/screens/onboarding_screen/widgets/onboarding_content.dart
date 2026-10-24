import 'package:evently_app/core/Providers/onboarding_provider.dart';
import 'package:evently_app/core/resources/strings_manager.dart';
import 'package:evently_app/core/reuseable_components/custom_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/model/onboarding_model.dart';
import 'package:evently_app/ui/screens/onboarding_screen/widgets/onboarding_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'onboarding_page_view.dart';

class onboardingContent extends StatelessWidget{
  final PageController controller;
  const onboardingContent({super.key ,  required this.controller});
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OnboardingProvider>();
    final onboardingList = onboardingModel.onboardingList(context);
    final currentOnboardingItem = onboardingList[provider.currentIndex];
    return Padding(
        padding: const EdgeInsetsDirectional.only(top: 24,start: 16,end: 16,bottom: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: OnboardingPageView(controller: controller)),
            Center(child: OnboardingSlider(controller: controller)),
            SizedBox(height: 16,),
            Text(
              currentOnboardingItem.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8,),
            Text(
              currentOnboardingItem.description,
              style: Theme.of(context).textTheme.bodySmall,

            ),
            SizedBox(height: 16,),
            CustomButton(
              onClicked: () {
                final isLastPage = provider.currentIndex == onboardingList.length-1;
                if(isLastPage){
                  Navigator.pushReplacementNamed(context, '/login');
                }else{
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
                }
              },
            title: provider.currentIndex== onboardingList.length-1 ?AppLocalizations.of(context)!.getStarted: AppLocalizations.of(context)!.next,),
          ],
        ),
      );
  }
}