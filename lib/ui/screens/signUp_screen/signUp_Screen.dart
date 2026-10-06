import 'package:evently_app/core/resources/routes_manager.dart';
import 'package:evently_app/core/resources/strings_manager.dart';
import 'package:evently_app/core/reuseable_components/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_constants.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/reuseable_components/custom_text_field.dart';

class SignupScreen extends StatefulWidget{
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 1,
        title: Image.asset(
          AssetsManager.logo,
          color: Theme.of(context).colorScheme.primary,
          width: MediaQuery.of(context).size.width*0.45,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
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
                SizedBox(height: 16,),
                CustomTextField(
                  keyboard: TextInputType.name,
                  controller: nameController,
                    hintText: StringsManager.enterName,
                    iconPath: AssetsManager.profile,
                  isPassword: false,
                  validation: (value) {
                    if(value == null || value.isEmpty){
                      return "Name can't be Empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                CustomTextField(
                  keyboard: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: StringsManager.enterEmail,
                  iconPath: AssetsManager.email,
                  isPassword: false,
                  validation: (value) {
                    if(value == null || value.isEmpty){
                      return "Email can't be Empty";
                    }
                    if(!RegExp(AppConstants.emailRegex).hasMatch(value)){
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                CustomTextField(
                  keyboard:TextInputType.text,
                  controller: passController,
                  hintText: StringsManager.enterPass,
                  iconPath: AssetsManager.lock,
                  isPassword: true,
                  validation: (value) {
                    if(value == null || value.isEmpty){
                      return "Password can't be empty";
                    }
                    if(!RegExp(AppConstants.passwordRegex).hasMatch(value)){
                      return "Password must be 8+ characters, with at least 1 uppercase letter and 1 special character.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: confirmPassController,
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
                SizedBox(height: 52,),
                CustomButton(title: "Sign UP", onClicked: (){}),
                const SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(StringsManager.alreadyHaveAcc,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14
                    ),),
                    InkWell(
                       onTap: () {
                         Navigator.pushReplacementNamed(context, RoutesManager.loginNameRoute);
                       },
                        child: Text("Login",style: Theme.of(context).textTheme.headlineSmall,))
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
      ),
    );
  }
}