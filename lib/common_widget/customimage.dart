import 'package:flutter/material.dart';


class CustomImage extends StatelessWidget {
  final String path;
  final double height;
  final Color bordercolor;
  const CustomImage(
      {super.key,
      required this.path,
      required this.height,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          path,
          height: height,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
