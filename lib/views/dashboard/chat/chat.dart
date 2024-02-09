import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      body: Center(
        child: Text(
          "CHAT PAGE",
          style: GoogleFonts.dmSans(fontSize: 40),
        ),
      ),
    );
  }
}