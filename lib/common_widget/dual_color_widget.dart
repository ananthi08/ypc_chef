import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KDualColour_widget extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  const KDualColour_widget({
    Key? key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: GoogleFonts.dmSans(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: color1 ?? Colors.black,
            ),
          ),
        
          TextSpan(
            text: text2,
            style: GoogleFonts.dmSans(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: color2 ?? Colors.red.shade700),
          ),
        ],
      ),
    );
  }
}

class Headtextdualcolor extends StatelessWidget {
  final String text1;
  final String text2;
  final String? text3;
  final double paddingHorizontal;
  final MainAxisAlignment mainaxisalignment;
  const Headtextdualcolor(
      {super.key,
      required this.text1,
      required this.text2,
      this.text3,
      required this.paddingHorizontal,
      required this.mainaxisalignment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Row(
        mainAxisAlignment: mainaxisalignment,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color:  Color(0xFF3E4D52),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text3 ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
