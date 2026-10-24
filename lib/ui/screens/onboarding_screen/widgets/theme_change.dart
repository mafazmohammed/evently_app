
import 'package:evently_app/core/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ThemeChange extends StatelessWidget{
  final ThemeMode mode;
  final String iconPath;
  ThemeChange({
    required this.iconPath,
    required this.mode
});
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
        backgroundColor:  mode== provider.themeMode
            ?Theme.of(context).colorScheme.primary
            :Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      onPressed: (){
        provider.switchMode(mode);
      },
      child: SvgPicture.asset(iconPath)
    );
  }

}