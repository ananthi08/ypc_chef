import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


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
class CustomSVGImage extends StatelessWidget {
  final String path;
  final double height;
  final Color bordercolor;
  const CustomSVGImage(
      {super.key,
      required this.path,
      required this.height,
      required this.bordercolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          path,
          height: height,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}