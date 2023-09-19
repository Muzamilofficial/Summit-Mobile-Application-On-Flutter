import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Home Screen/Screen_Home.dart';
import '../Image Screen/Screen_Image.dart';
import '../Profile Screen/Screen_Profile.dart';
import '../Voice Screen/Screen_Voice.dart';

class SummaryScreen extends StatefulWidget {
  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {

  int _selectedIndex = 99;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle the case when the user is not logged in.
      return Center(child: Text('Please log in to view summaries.'));
    }

    // Define your custom color scheme
    final customColorScheme = ColorScheme.light().copyWith(
      primary: Colors.blue, // Customize primary color
      onPrimary: Colors.white, // Customize text color on primary color
      secondary: Color(0xFF444444), // Replace black with #444444
      onSecondary: Colors.white, // Customize text color on secondary color
    );

    return Theme(
      data: ThemeData(
        colorScheme: customColorScheme, // Apply custom color scheme
      ),
      child: Scaffold(
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
                'SM RECORD',
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(
                  user.email!) // Use the user's email as the collection name
              .orderBy('timestamp',
                  descending: true) // Sort by timestamp in descending order
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No summaries found.'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final summaryData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                final summary = summaryData['summary'] as String;
                final timestamp = summaryData['timestamp'] as Timestamp;

                // Split the summary into words
                final words = summary.split(' ');

                // Take the first 20 words and join them back into a string
                final first20Words = words.take(20).join(' ');

                return GestureDetector(
                  onTap: () {
                    _showSummaryModal(context, summaryData);
                  },
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        first20Words, // Display the first 20 words of the summary
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            'Created on: ${timestamp.toDate()}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.pink, // Customize the icon color to pink
                      ),
                    ),
                  ),
                );
              },
            );
          },
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyScreen()));
                }
                if (_selectedIndex == 3) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                }
              });
            }),
      ),
    );
  }

  void _showSummaryModal(
      BuildContext context, Map<String, dynamic> summaryData) {
    final summaryText =
        summaryData['summary'] as String; // Get the summary text

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Summary:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.copy, // Use the copy icon
                        color: Colors.pink, // Customize the icon color
                      ),
                      onPressed: () {
                        // Copy the summary text to the clipboard
                        Clipboard.setData(ClipboardData(text: summaryText));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Summary copied to clipboard.'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  summaryText,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Created on: ${summaryData['timestamp'].toDate()}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
