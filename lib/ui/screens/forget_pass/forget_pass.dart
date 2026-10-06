import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:evently_app/core/reuseable_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Forget Password",style: Theme.of(context).textTheme.titleLarge,),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
              onPressed: (){
              Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.back,
                size: 24,
                color: Theme.of(context).colorScheme.onPrimary,),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(AssetsManager.forgetPass,
              color: Theme.of(context).colorScheme.onPrimary,
              height: MediaQuery.of(context).size.height*0.48,
              fit: .contain,
            ),
            const SizedBox(height: 40,),
            CustomButton(title: "Reset Password", onClicked: (){}),
          ],
        ),
      ),
    );
  }
  
}