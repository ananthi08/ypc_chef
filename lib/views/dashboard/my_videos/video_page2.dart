import 'package:chef_frontend/common_widget/commentbox/cmd_box.dart';
import 'package:chef_frontend/common_widget/custom%20navbar/nav_model.dart';
import 'package:chef_frontend/common_widget/likebutton.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/feed/FEED.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:chef_frontend/views/dashboard/my_videos/my_videos_page_1.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shimmer/shimmer.dart';

class Myvideospage2 extends StatefulWidget {
  static String route = '/chef/videos2';

  const Myvideospage2({Key? key}) : super(key: key);

  @override
  State<Myvideospage2> createState() => _Myvideospage2State();
}

class _Myvideospage2State extends State<Myvideospage2> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final messageNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];
  bool isCommentBoxVisible = false;
  @override
  void initState() {
    super.initState();
    fetchAndDisplayVideos();
    items = [
      NavModel(
        page: const Dashboardview(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const Feed(),
        navKey: messageNavKey,
      ),
    ];
  }

  final GETchefDetails fetchall_videos = GETchefDetails();
  List<Map<String, dynamic>> videos = [];

  Future<void> fetchAndDisplayVideos() async {
    try {
      final fetchedVideos = await fetchall_videos.fethallvideos();
      if (fetchedVideos != null) {
        setState(() {
          videos = fetchedVideos;
        });
      }
    } catch (e) {
      print('Error fetching and displaying videos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 246, 246, 246),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                height: 130,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IconButton(
                    //   icon: const Icon(Icons.arrow_back),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const Myvideospage(),
                    //       ),
                    //     );
                    //   },
                    // ),

                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Myvideospage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/mxplayer.jpeg"),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'My Videos',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final videoUrl = videos[index]['videoUrl'];
                    final videoController = VideoPlayerController.networkUrl(
                        // Uri.parse('$node$videoUrl'));
                        Uri.parse(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

                    return FutureBuilder(
                      future: videoController.initialize(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (videoController.value.isPlaying) {
                                    videoController.pause();
                                  } else {
                                    videoController.play();
                                  }
                                  print('Tapped video URL: $videoUrl');
                                },
                                child: Container(
                                  width: 391.13,
                                  height: 194,
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 18, right: 18),
                                  child: Card(
                                    child: AspectRatio(
                                      aspectRatio: 5 / 6,
                                      child: VideoPlayer(videoController),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        LikeButton(videoUrl),
                                        const Text(
                                          'Likes',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isCommentBoxVisible =
                                                  !isCommentBoxVisible;
                                            });
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(Icons.insert_comment_sharp),
                                              Text(
                                                'Comments',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    viewsCount(),
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: isCommentBoxVisible ? 200 : 0,
                                padding: const EdgeInsets.all(16),
                                child: isCommentBoxVisible
                                    ? Column(
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Write a comment...',
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              print("");
                                            },
                                            child: const Text('Submit'),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          print('Error initializing video: ${snapshot.error}');
                          return const Card(
                            child: Center(
                              child: Text('Video Playback Error'),
                            ),
                          );
                        } else {
                          // return const Card(
                          //   child: Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          // );
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 391.13,
                              height: 194,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 18, right: 18),
                              child: Card(
                                child: AspectRatio(
                                  aspectRatio: 5 / 6,
                                  child: Container(
                                    color: Colors
                                        .grey, // Customize the skeleton loader appearance
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
         
              
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UploadVideo(),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 3,
              color: Color.fromARGB(255, 169, 169, 169),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
