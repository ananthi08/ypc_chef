import 'dart:io';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';



class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  VideoPlayerScreen({required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }


}







//  Row(
//              children: [
//                Expanded(
//                  flex: 6,
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(
//                        color: const Color.fromARGB(255, 229, 229, 229),
//                        width: 10.0,
//                      ),
//                      borderRadius: const BorderRadius.only(
//                        topLeft: Radius.circular(10),
//                        bottomLeft: Radius.circular(10),
//                      ),
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 10),
//                      child: TextField(
//                        decoration: InputDecoration(
//                          border: InputBorder.none, // Remove the outer border
//                          hintText: 'Enter Ingredient name',
//                          focusedBorder: InputBorder.none,
//                          enabledBorder: InputBorder.none,
//                          // Add a radius inside the input field
//                          contentPadding: EdgeInsets.symmetric(vertical: 10),
//                          isCollapsed: true,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 2,
//                  child: Container(
//                    decoration: BoxDecoration(
//                      border: Border.all(
//                        color: const Color.fromARGB(255, 229, 229, 229),
//                        width: 10.0,
//                      ),
//                      borderRadius: const BorderRadius.only(
//                        topRight: Radius.circular(10),
//                        bottomRight: Radius.circular(10),
//                      ),
//                    ),
//                    child: Center(
//                      child: TextField(
//                        decoration: InputDecoration(
//                          border: InputBorder.none, // Remove the outer border
//                          hintText: ' Qnty',
//                          focusedBorder: InputBorder.none,
//                          enabledBorder: InputBorder.none,
//                          // Add a radius inside the input field
//                          contentPadding: EdgeInsets.symmetric(vertical: 10),
//                          isCollapsed: true,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),