import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

import '../Home Screen/Screen_Home.dart';
import '../Profile Screen/Screen_Profile.dart';
import '../Voice Screen/Screen_Voice.dart'; // Import for clipboard functionality

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyHomePageState();
}
  int _selectedIndex = 2;
  final Header = Material(
    child: Column(
      children: <Widget>[
        Container(
          height: 140,
          decoration: BoxDecoration(
            // ignore: prefer_const_literals_to_create_immutables
            gradient: LinearGradient(colors: [
              // Color.fromARGB(255, 248, 119, 162),
              // Color.fromARGB(255, 241, 175, 131),
              Color.fromARGB(255, 241, 104, 150),
              Color.fromARGB(255, 253, 160, 98),
            ]),
          ),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 65,
                  width: 192,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 70,
                              child: Badge(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 0.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          8), // Border radius
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/images/streak.png',
                                          height: 50.0,
                                          width: 50.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20.0, right: 0.0),
                              width: 100,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  'Keep It Going! Streak',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.center,
                  height: 65,
                  width: 192,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 70,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 0.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        8), // Border radius
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/images/workout.png',
                                        height: 50.0,
                                        width: 50.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 00.0, right: 0.0),
                              width: 95,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  'Record',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 0.0, right: .0),
                              child: Icon(
                                // <-- Icon
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.white.withOpacity(0.7),
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -60),
          child: Container(
            height: 40,
            width: 293,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.black.withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                  height: 30,
                  width: 92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Colors.black.withOpacity(0.3),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                    height: 30,
                    //color: Colors.black,
                    width: 92,
                    alignment: Alignment.center,
                    child: const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                    height: 30,
                    //color: Colors.black,
                    width: 92,
                    alignment: Alignment.center,
                    child: const Text(
                      'Voice',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                    onTap: () {}),
                InkWell(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: const Text(
                      'Image',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

class _MyHomePageState extends State<MyScreen> {
  bool textScanning = false;
  XFile? imageFile;
  String scannedText = "";
  String userInput = ""; // Updated to store extracted text
  String summarizedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Image PROCE',
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
                'Voice',
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
                      Icons.payment,
                      color: Colors.black54,
                      size: 33,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ProgressPage()));
                    }),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        //centerTitle: true,
      ),
    
      body: Center(
        child: SingleChildScrollView(
          
          child: Column(
            children: [
              
            Header,
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (textScanning) const CircularProgressIndicator(),
                    if (!textScanning && imageFile == null)
                      Container(
                        width: 300,
                        height: 300,
                        color: Colors.grey[300]!,
                      ),
                    if (imageFile != null) Image.file(File(imageFile!.path)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink, // Pink color
                              onPrimary: Colors.grey,
                              shadowColor: Colors.grey[400],
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Rounded edges
                              ),
                            ),
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 30,
                                    color: Colors.white, // White icon color
                                  ),
                                  Text(
                                    "Gallery",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white, // White text color
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink, // Pink color
                              onPrimary: Colors.grey,
                              shadowColor: Colors.grey[400],
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), // Rounded edges
                              ),
                            ),
                            onPressed: () {
                              getImage(ImageSource.camera);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Colors.white, // White icon color
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white, // White text color
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Display extracted text in the TextField
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      // height: 400, // Set the height to 400
                      child: SingleChildScrollView(
                        // Wrap with SingleChildScrollView
                        child: TextField(
                          onChanged: (text) {
                            userInput = text;
                          },
                          maxLines: null, // Allow unlimited lines
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter text to summarize...',
                          ),
                          controller: TextEditingController(text: userInput), // Set the initial text to the extracted text
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // Basic extractive summarization: Use the first 3 sentences as the summary
                          List<String> sentences = userInput.split('.');
                          int numSentences = sentences.length >= 3 ? 3 : sentences.length;
                          summarizedText = sentences.sublist(0, numSentences).join('.').trim();
                        });
                      },
                      child: Text(
                        'Text Summarize',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink), // Pink color
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded edges
                          ),
                        ),
                      ),
                    ),
                    if (summarizedText.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          children: [
                            Text(
                              summarizedText,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            TextButton( // Copy Text Button
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: summarizedText));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Text copied to clipboard"),
                                  ),
                                );
                              },
                              child: Text(
                                'Copy Text',
                                style: TextStyle(
                                  color: Colors.pink, // Pink text color
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0), // Rounded edges
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyScreen()));
              }
              if (_selectedIndex == 3) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ProfilePage()));
              }
              print(index);
            });
          }),
    
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        //await getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occurred while scanning";
      setState(() {});
    }
  }

  // Future<void> getRecognisedText(XFile image) async {
  //   final inputImage = InputImage.fromFilePath(image.path);
  //   final textRecognizer = GoogleMlKit.vision.textRecognizer();
  //   try {
  //     RecognizedText recognisedText = await textRecognizer.processImage(inputImage);
  //     scannedText = "";
  //     for (TextBlock block in recognisedText.blocks) {
  //       for (TextLine line in block.lines) {
  //         scannedText = scannedText + line.text + "\n";
  //       }
  //     }
  //     // Update the userInput with the extracted text
  //     userInput = scannedText;
  //   } catch (e) {
  //     scannedText = "Error occurred while recognizing text";
  //   } finally {
  //     textRecognizer.close();
  //     textScanning = false;
  //     setState(() {});
  //   }
  // }

}
