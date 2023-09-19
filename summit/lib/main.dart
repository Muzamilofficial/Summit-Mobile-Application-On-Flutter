import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summit/Screens/Register_Screen/register_screen.dart';
import 'package:summit/Screens/Splash%20Screen/Screen_Splash.dart';
import 'package:summit/Screens/Welcome%20Screen/Screen_Welcome.dart';

import 'Screens/Home Screen/Screen_Home.dart';
import 'Screens/Image Screen/Screen_Image.dart';
import 'Screens/OnBoarding Screen/Screen_Onboarding.dart';
import 'Screens/Profile Screen/Screen_Profile.dart';
import 'Screens/Record Screen/Screen_Record.dart';
import 'Screens/Voice Screen/Screen_Voice.dart';
import 'models/FirebaseUser.dart';
import 'models/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.black,
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
          ),
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),

        
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}