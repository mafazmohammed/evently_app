import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_constants.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../core/reuseable_components/custom_button.dart';
import '../../../core/reuseable_components/custom_text_field.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  @override
  void initState() {
    super.initState();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }
  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logo,
          color: Theme.of(context).colorScheme.primary,
          width: MediaQuery.of(context).size.width*0.45,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                StringsManager.signUpTitle,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 24,
                    fontWeight: .w600
                ),
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                controller: passController,
                keyboard: TextInputType.text,
                hintText: StringsManager.enterPass,
                iconPath: AssetsManager.lock,
                isPassword: true,
                validation: (value) {
                  if(value == null || value.isEmpty){
                    return "Password can't be empty";
                  }
                  // if(!RegExp(AppConstants.passwordRegex).hasMatch(value)){
                  //   return "Password must be 8+ characters, with at least 1 uppercase letter and 1 special character.";
                  // }
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              CustomTextField(
                controller: confirmPassController,
                keyboard: TextInputType.text,
                hintText: StringsManager.confirmPass,
                iconPath: AssetsManager.lock,
                isPassword: true,
                validation: (value) {
                  if(value != passController.text){
                    return "Passwords don't match";
                  }
                  return null;
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.forgetPassNameRoute);
                },
                child: Row(
                  mainAxisAlignment: .end,
                  children: [
                    Text("Forget Password? ",style: Theme.of(context).textTheme.headlineSmall,),
                  ],
                ),
              ),
              SizedBox(height: 52,),
              CustomButton(title: "Login", onClicked: (){}),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(StringsManager.dontHaveAcc,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14
                  ),),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RoutesManager.signUpNameRoute);

                      },
                      child: Text("SignUP",style: Theme.of(context).textTheme.headlineSmall,))
                ],
              ),
              const SizedBox(height: 32,),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text("Or",style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize:16,
                      fontWeight: .w500
                  ),),
                ],
              ),
              const SizedBox(height: 24,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer              ),
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Image.asset(AssetsManager.googleLogo,height: 24, width: 24,),
                    Text(StringsManager.signGoogle , style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 18,
                        fontWeight: .w500
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}