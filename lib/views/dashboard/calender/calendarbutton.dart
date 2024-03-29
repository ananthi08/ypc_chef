import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

onTap: () => onTap,

child: Container(
  width: 100,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: const Color(0xFF4e5ae8),
  ),
  child: Center(child: Text(label, style:  GoogleFonts.dmSans(color: Colors.white),)) ,
),
    );
  }
}