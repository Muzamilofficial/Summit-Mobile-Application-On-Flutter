import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:summit/Screens/Home%20Screen/Screen_Home.dart';

import '../Screens/Welcome Screen/Screen_Welcome.dart';
import '../models/FirebaseUser.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    // Check if the user is authenticated
    if (user != null) {
      // User is logged in, show home screen
      return TextSummarizationApp(); // Replace with your actual home screen widget
    } else {
      // User is not logged in, show welcome screen
      return WelcomeScreen(); // Replace with your actual welcome screen widget
    }
  }
}
