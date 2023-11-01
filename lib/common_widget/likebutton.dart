
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final String videoUrl;

    LikeButton(this.videoUrl);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
        print('Video URL: ${widget.videoUrl}, Liked: $isLiked');
      },
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite,

        color: isLiked ? Colors.red : Color.fromRGBO(62, 77, 82, 1.0),
        size: 24, // Set the size as needed
      ),
    );
  }
}

class viewsCount extends StatefulWidget {
  @override
  _viewsCountState createState() => _viewsCountState();
}

class _viewsCountState extends State<viewsCount> {
  int viewsCount = 100;

  @override
  Widget build(BuildContext context) {
    return Text(' $viewsCount views');
  }
}
