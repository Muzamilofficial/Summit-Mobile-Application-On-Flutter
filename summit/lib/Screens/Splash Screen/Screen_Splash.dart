// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:summit/Screens/Welcome%20Screen/Screen_Welcome.dart';

import '../../Authentications/Screen_Authentications.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  final bool isLoggedIn = true; // Replace with your login check logic

  SplashScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Fat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: AnimatedSplashScreen(
            splash:
                Image.asset('assets/images/logo.png', height: 300, width: 300),
            splashIconSize: 150,
            //duration: 40000000000000000,
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.deepPurple.shade900,
            nextScreen: AuthWrapper()),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
