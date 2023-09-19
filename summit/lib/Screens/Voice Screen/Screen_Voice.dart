import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/services.dart';

import '../Home Screen/Screen_Home.dart';
import '../Image Screen/Screen_Image.dart';
import '../Profile Screen/Screen_Profile.dart'; // Import for clipboard functionality

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

int _selectedIndex = 1;
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
                              margin:
                                  const EdgeInsets.only(left: 20.0, right: 0.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(8), // Border radius
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
                            margin: const EdgeInsets.only(left: 0.0, right: .0),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: const Text(
                      'Voice',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                  onTap: () {}),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                  height: 30,
                  //color: Colors.black,
                  width: 92,
                  alignment: Alignment.center,
                  child: const Text(
                    'Speech',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
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

class _SpeechScreenState extends State<SpeechScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.pink, // Change to pink
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green, // Change to green
        fontWeight: FontWeight.bold,
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.red, // Change to red
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.pinkAccent, // Change to pinkAccent
        fontWeight: FontWeight.bold,
      ),
    ),
    'comment': HighlightedWord(
      onTap: () => print('comment'),
      textStyle: const TextStyle(
        color: Colors.green, // Change to green
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;
  String _summarizedText = '';
  final int textFieldCharacterLimit = 2500;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

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
              'FOR YOU',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Colors.pink, // Change to pink
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          backgroundColor: Colors.pink, // Change to pink
          child: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
            color: Colors.white, // Change the mic icon color to white
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Header,
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: Column(
                children: [
                  TextHighlight(
                    text: _text,
                    words: _highlights,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _summarizeText,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink, // Change to pink
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Make it rounded
                      ),
                    ),
                    child: Text(
                      'Summarize Text',
                      style: TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  if (_summarizedText.isNotEmpty)
                    TextField(
                      readOnly: true,
                      maxLines: 5,
                      controller: TextEditingController(text: _summarizedText),
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Summarized Text',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _copySummarizedText,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink, // Change to pink
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Make it rounded
                          ),
                        ),
                        icon: Icon(
                          Icons.content_copy,
                          color: Colors.white, // Copy icon color
                        ),
                        label: Text(
                          'Copy Summary',
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text:
                          'Character Count: ${_text.length} / $textFieldCharacterLimit',
                    ),
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Speech Text',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
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

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (_text.length > textFieldCharacterLimit) {
              _text = _text.substring(0, textFieldCharacterLimit);
            }
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _summarizeText() {
    String inputText = _text;

    // Implement the summarization logic here.
    // For example, you can use extractive summarization with the first 3 sentences as the summary.

    // Basic extractive summarization: Use the first 3 sentences as the summary
    List<String> sentences = inputText.split('.');
    int numSentences = sentences.length >= 3 ? 3 : sentences.length;
    String summarizedText = sentences.sublist(0, numSentences).join('.').trim();

    setState(() {
      _summarizedText = summarizedText;
    });
  }

  void _copySummarizedText() {
    Clipboard.setData(ClipboardData(text: _summarizedText));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Summary copied to clipboard'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SpeechScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
