import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:medical_app_final_project/OnBoardingScreen.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home :AnimatedSplashScreen(
      splash: 'images/splashScreen.png',
      nextScreen: OnBoardingScreen(),
      splashTransition: SplashTransition.fadeTransition,
    ),);
  }
}
