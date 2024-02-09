import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentButton extends StatefulWidget {
  final String videoUrl;
  final Function(String videoUrl) onCommentButtonTapped;

  CommentButton({
    required this.videoUrl,
    required this.onCommentButtonTapped,
  });

  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onCommentButtonTapped(widget.videoUrl);
      },
      child:  Row(
        children: [
          const Icon(Icons.insert_comment_sharp),
          Text(
            'Comments',
            style: GoogleFonts.dmSans(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
