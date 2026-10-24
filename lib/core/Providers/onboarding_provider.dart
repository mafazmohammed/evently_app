import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier{
   int currentIndex=0;
   void onPageChanged(int index){
    currentIndex = index;
    notifyListeners();
  }
}