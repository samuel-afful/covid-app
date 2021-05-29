import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'datasource.dart';
import 'homepage.dart';
import 'package:theme_manager/change_theme_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_manager/theme_manager.dart';

void main() {

  runApp(
  MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

        return ThemeManager(
          data: (brightness){
            return ThemeData(
          
              primaryColor: primaryBlack,
              fontFamily: 'Circular',
              brightness: brightness==Brightness.dark?Brightness.light:Brightness.dark,
              scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white
            );
          },
          themedWidgetBuilder: (context,theme){
            return   MaterialApp(
           debugShowCheckedModeBanner: false,
            theme: theme,
            home:Home(),
              builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          
    
  
             
          ));
          },
             
        );
  }
}