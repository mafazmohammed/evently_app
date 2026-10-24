import 'package:evently_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget{
  final String hintText;
  final String iconPath;
  final bool isPassword;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?) validation;
  const CustomTextField({
    required this.hintText,
    required this.iconPath,
    required this.isPassword,
    required this.validation,
    required this.controller,
    required this.keyboard
});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visibleOff= true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      controller: widget.controller,
      validator: widget.validation,
      obscureText: widget.isPassword? visibleOff : false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary
          )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary
            )
        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary
            )
        ),
        errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary
            )
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(widget.iconPath),
        ),
        prefixIconConstraints: BoxConstraints.tight(Size(
            40,
            40
        )),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 14,
        ),
        suffixIcon: widget.isPassword 
            ? IconButton(
            onPressed: () {
              setState(() {
                visibleOff = !visibleOff;
              });
            },
            icon: SvgPicture.asset(
              height: 24,
              width: 24,
              visibleOff
                  ? AssetsManager.visibleOff
                  : AssetsManager.visibleOn
            )
        )
            : null,
      ),
    );
  }
}