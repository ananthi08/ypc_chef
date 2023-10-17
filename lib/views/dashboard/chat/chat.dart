import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Center(
        child: Text(
          "CHAT PAGE",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}