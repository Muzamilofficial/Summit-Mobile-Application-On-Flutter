import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Image Screen/Screen_Image.dart';
import '../Profile Screen/Screen_Profile.dart';
import '../Voice Screen/Screen_Voice.dart';

void main() {
  runApp(TextSummarizationApp());
}

class TextSummarizationApp extends StatefulWidget {
  @override
  State<TextSummarizationApp> createState() => _TextSummarizationAppState();
}

class _TextSummarizationAppState extends State<TextSummarizationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
      home: TextSummarizationScreen(),
    );
  }
}

  get Header => Material(
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
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
                                          padding: const EdgeInsets.all(8),
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
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 0.0),
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
                                        padding: const EdgeInsets.all(8),
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
                                  margin: const EdgeInsets.only(
                                      left: 00.0, right: 0.0),
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
                                  margin: const EdgeInsets.only(
                                      left: 0.0, right: .0),
                                  child: Icon(
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
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'HOME',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                          height: 30,
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
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 0.0),
                        height: 30,
                        width: 92,
                        alignment: Alignment.center,
                        child: const Text(
                          'Image',
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

class TextSummarizationScreen extends StatefulWidget {
  @override
  _TextSummarizationScreenState createState() =>
      _TextSummarizationScreenState();
}

class _TextSummarizationScreenState extends State<TextSummarizationScreen> {
  String inputText = "";
  String summary = "";

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 0.0, right: 35.0),
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
                    img: (FirebaseAuth.instance.currentUser?.photoURL),
                  ),
                ),
                onTap: () {}),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50.0, right: 0.0),
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
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 38.0, right: 6.0),
              alignment: Alignment.center,
              child: Text(
                'GET PRO',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w900,
                  textStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      background: Paint()
                        ..color = Colors.lightBlue.shade300
                        ..strokeWidth = 14
                        ..strokeJoin = StrokeJoin.round),
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
                    onPressed: () {}),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: TextField(
                    maxLines: 13,
                    decoration: InputDecoration(
                      hintText: 'Enter text to summarize...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        inputText = text;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: generateSummary,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow),
                      SizedBox(width: 8),
                      Text('Generate Summary'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          summary,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: copySummaryToClipboard,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              icon: Icon(Icons.copy),
                              label: Text('Copy Summary'),
                            ),
                          ],
                        ),
                        TextButton.icon(
                          onPressed: () {
                            saveSummaryToFirestore(summary);
                          },
                          icon: Icon(Icons.save),
                          label: Text('Save Summary'),
                        ),
                      ],
                    ),
                  ),
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
          haptic: true,
          hoverColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          tabs: const [
            GButton(
              icon: Icons.home,
              textColor: Colors.pinkAccent,
              iconColor: Colors.white,
              text: 'Home',
            ),
            GButton(
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
            });
          }),
    
    );
  }

Future<void> saveSummaryToFirestore(String summary) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userEmail = user.email;
      final documentName = '$userEmail'+summary;

      await FirebaseFirestore.instance.collection(userEmail!).doc(documentName).set({
        'summary': summary,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Summary saved to Firestore'),
        ),
      );
    }
  } catch (error) {
    print('Error saving summary: $error');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error saving summary'),
      ),
    );
  }
}

  void generateSummary() {
    final sentences = inputText.split(RegExp(r'(?<=[.!?])\s+'));
    final sentenceScores = calculateSentenceScores(sentences);
    final summarySentences = selectTopSentences(sentenceScores, 2);
    final generatedSummary = summarySentences.join(' ');

    setState(() {
      summary = generatedSummary;
    });

    //saveSummaryToFirestore(summary);
  }

  void copySummaryToClipboard() {
    Clipboard.setData(ClipboardData(text: summary));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Summary copied to clipboard'),
      ),
    );
  }

  Map<String, double> calculateSentenceScores(List<String> sentences) {
    final sentenceScores = <String, double>{};

    for (var i = 0; i < sentences.length; i++) {
      final sentence = sentences[i];
      final words = sentence.split(' ');
      double score = words.length.toDouble();
      for (var word in words) {
        word = word.toLowerCase();
        if (!isStopword(word)) {
          score += 1.0;
        }
      }
      sentenceScores[sentence] = score;
    }

    return sentenceScores;
  }

  List<String> selectTopSentences(
      Map<String, double> sentenceScores, int numSentences) {
    final sortedSentences = sentenceScores.keys.toList()
      ..sort((a, b) => sentenceScores[b]!.compareTo(sentenceScores[a]!));

    final selectedSentences = <String>[];
    for (var i = 0; i < numSentences && i < sortedSentences.length; i++) {
      selectedSentences.add(sortedSentences[i]);
    }

    return selectedSentences;
  }

  bool isStopword(String word) {
    final stopwords = Set<String>.from([
      'i',
      'me',
      'my',
      'myself',
      'we',
      'our',
      'ours',
      'ourselves',
      'you',
      'your',
      'yours',
      'yourself',
      'yourselves',
      'he',
      'him',
      'his',
      'himself',
      'she',
      'her',
      'hers',
      'herself',
      'it',
      'its',
      'itself',
      'they',
      'them',
      'their',
      'theirs',
      'themselves',
      'what',
      'which',
      'who',
      'whom',
      'this',
      'that',
      'these',
      'those',
      'am',
      'is',
      'are',
      'was',
      'were',
      'be',
      'been',
      'being',
      'have',
      'has',
      'had',
      'having',
      'do',
      'does',
      'did',
      'doing',
      'a',
      'an',
      'the',
      'and',
      'but',
      'if',
      'or',
      'because',
      'as',
      'until',
      'while',
      'of',
      'at',
      'by',
      'for',
      'with',
      'about',
      'against',
      'between',
      'into',
      'through',
      'during',
      'before',
      'after',
      'above',
      'below',
      'to',
      'from',
      'up',
      'down',
      'in',
      'out',
      'on',
      'off',
      'over',
      'under',
      'again',
      'further',
      'then',
      'once'
    ]);

    return stopwords.contains(word);
  }
}
