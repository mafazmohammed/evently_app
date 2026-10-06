import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String title;
  final VoidCallback onClicked;
  const CustomButton({
    required this.title,
    required
   this.onClicked
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,

        ),
          onPressed: onClicked,
          child: Text(title,style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: .w500,
            fontSize: 20
          ),),
      ),
    );
  }

}