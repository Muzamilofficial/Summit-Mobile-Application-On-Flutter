import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:summit/Screens/Welcome%20Screen/Screen_Welcome.dart';

import '../../models/Auth.dart';
import '../Home Screen/Screen_Home.dart';
import '../Image Screen/Screen_Image.dart';
import '../Record Screen/Screen_Record.dart';
import '../Voice Screen/Screen_Voice.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDarkMode = false;
  File? _selectedImage;
  User? _user;

  final AuthService _auth = new AuthService();

  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });

      // Upload the new image to Firebase Storage
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final storage = FirebaseStorage.instance;
        final reference = storage.ref().child('profile_images/${user.uid}');
        await reference.putFile(_selectedImage!);

        // Get the download URL of the uploaded image
        final imageUrl = await reference.getDownloadURL();

        // Update the user's profile with the new image URL
        await user.updatePhotoURL(imageUrl);

        setState(() {
          _user = user;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 0.0, right: 35.0),
              //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
              alignment: Alignment.center,
              child: InkWell(
                  child: Container(
                    child: ProfilePicture(
                      name: FirebaseAuth.instance.currentUser!.email!,
                      radius: 16,
                      fontsize: 15,
                      random: true,
                      count: 2,
                      tooltip: true,
                      //role: 'ADMINISTRATOR',
                      img: (FirebaseAuth.instance.currentUser?.photoURL),
                      //img: 'https://avatars.githubusercontent.com/u/37553901?v=4',
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50.0, right: 0.0),
              //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
              alignment: Alignment.center,
              child: Text(
                'PROFILE SCR',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                )),
              ),
            ),
            GestureDetector(
              // When the child is tapped, show a snackbar
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => PedometerFunction()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 38.0, right: 6.0),
                //padding: const EdgeInsets.only(left: 20.0, right: 0.0),
                alignment: Alignment.center,
                child: Text(
                  'Get Pro',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    textStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      background: Paint()
                        ..color = Colors.lightBlue.shade300
                        ..strokeWidth = 14
                        ..strokeJoin = StrokeJoin.round
                        //..strokeCap = StrokeCap.round
                        ..style = PaintingStyle.stroke,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.0, right: 5.0),
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      color: isDarkMode
                          ? Colors.white
                          : Colors
                              .black, // Set icon color based on dark mode state
                    ),
                    onPressed: toggleDarkMode,
                  )
                ],
              ),
            ),
          
          ],
          backgroundColor: Colors.white,
          //centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (_user?.photoURL != null
                            ? NetworkImage(_user!.photoURL!)
                            : AssetImage('assets/profile_image.jpg')
                                as ImageProvider<Object>),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () => _pickImage(ImageSource.camera),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.photo,
                        color: Colors.green,
                      ),
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                _user?.displayName ?? 'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our Proud User',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              buildInfoRow(Icons.email, _user?.email ?? 'johndoe@example.com'),
              buildInfoRow(Icons.phone, 'for support call : 021-11111-323'),
              buildInfoRow(
                  Icons.person, 'for support email : summit@support.com'),
              buildInfoRow(Icons.verified_user_rounded, '400+ verified users'),
              
              SizedBox(height: 50),
              ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SummaryScreen(), // Replace RecordPage with your actual page name
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.pink, // Change the button color to pink
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text(
                            'Show Record',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white, // Text color
                            ),
                          ),
                          width: 100, // Adjust the width as needed
                        ),
                      ),
              
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for editing profile here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Change the button color to red
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                    await GoogleSignIn().signOut();
                    await _auth.signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Change the button color to red
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white, // Text color
                          ),
                        ),
                        width: 100, // Adjust the width as needed
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
            gap: 8,
            iconSize: 30,
            color: Colors.grey[800],
            backgroundColor: Colors.white,
            rippleColor: Colors.grey,
            activeColor: Colors.pinkAccent,
            haptic: true, // haptic feedback
            hoverColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                // textColor: Colors.pinkAccent,
                // iconColor: Colors.white,
                icon: Icons.mic,
                text: 'Voice',
              ),
              GButton(
                icon: Icons.image,
                text: 'Image',
              ),
              GButton(
                icon: Icons.supervised_user_circle_rounded,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                if (_selectedIndex == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TextSummarizationApp()));
                }
                if (_selectedIndex == 1) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SpeechScreen()));
                }
                if (_selectedIndex == 2) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyScreen()));
                }
                if (_selectedIndex == 3) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }
                print(index);
              });
            }),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
                   
          Icon(icon, size: 24),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
