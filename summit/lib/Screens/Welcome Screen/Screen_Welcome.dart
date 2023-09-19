// ignore_for_file: use_key_in_widget_constructors, override_on_non_overriding_member, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, depend_on_referenced_packages, unused_import, avoid_print, curly_braces_in_flow_control_structures, deprecated_member_use, unnecessary_new, unused_label

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summit/main.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home Screen/Screen_Home.dart';
import '../OnBoarding Screen/Screen_Onboarding.dart';
import '../Splash Screen/Screen_Splash.dart';
import '../Wrapper Screen/wrapper_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore: todo
  late VideoPlayerController _controller;
  GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  //FirebaseUser _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;
  bool google = false;
  // ignore: todo
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/videos/bg4.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        //aspectRatio:
        //_controller.value.aspectRatio;
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        aspectRatio:
        _controller.value.aspectRatio;
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Adjusted theme colors to match logo.
        primaryColor: Color(0xffb55e28),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xffffd544)),
      ),
      home: SafeArea(
        child: Scaffold(
          // ignore: todo
          body: Stack(
            children: <Widget>[
              // ignore: todo
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

  // ignore: todo
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// A basic login widget with a logo and a form with rounded corners.
class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          //color: Colors.white.withAlpha(400),
          //color: Colors.white.withAlpha(100),
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 140, // <-- SEE HERE
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 1000,
              ),
              Column(
                children: [
                  Text(
                    'Premium Notes Always.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Free Here.',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100, // <-- SEE HERE
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: FloatingActionButton.extended(
                      label: Text('SIGN UP WITH GOOGLE'),
                      elevation: 0, // <-- Text
                      //backgroundColor: Colors.black.withOpacity(0.5),
                      backgroundColor: Colors.white.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      extendedTextStyle: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),

                      icon: Icon(
                        // <-- Icon
                        Icons.mail,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        //signInWithGoogle();

                        GoogleSignInAccount? googleUser =
                            await GoogleSignIn().signIn();
                        GoogleSignInAuthentication? googleAuth =
                            await googleUser?.authentication;

                        AuthCredential credential =
                            GoogleAuthProvider.credential(
                                accessToken: googleAuth?.accessToken,
                                idToken: googleAuth?.idToken);
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithCredential(credential);
                        debugPrint(userCredential.user?.displayName);

                        if (userCredential.user != null) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => OnBoarding()));
                        }
                      },
                      heroTag: BoxShadow(
                        color: Colors.transparent,
                        spreadRadius: 7,
                        blurRadius: 7,
                        offset: Offset(3, 5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10, // <-- SEE HERE
                  ),
                  SizedBox(
                    // ignore: unnecessary_new
                    height: 50,
                    child: new GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wrapper()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.orangeAccent,
                              Colors.pinkAccent
                            ]),
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30, // <-- SEE HERE
                  ),
                  SizedBox(
                    child: new GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Register()),
                        // );
                      },
                      child: Text(
                        'Not have an account? Signup',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
