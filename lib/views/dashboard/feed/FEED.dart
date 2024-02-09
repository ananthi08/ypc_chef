import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child: Text(
          "Feed PAGE",
          style: GoogleFonts.dmSans(fontSize: 40),
        ),
      ),
    );
  }
}