import 'package:chef_frontend/common_widget/custom_navbar/nav_model.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/feed/FEED.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:chef_frontend/views/dashboard/my_videos/video_page2.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class Myvideospage extends StatefulWidget {
  static String route = '/chef/videos1';

  const Myvideospage({Key? key}) : super(key: key);

  @override
  State<Myvideospage> createState() => _MyvideospageState();
}

class _MyvideospageState extends State<Myvideospage> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final messageNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;
  List<NavModel> items = [];

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
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dashboardview(),
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
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final videoUrl = videos[index]['videoUrl'];
                    // final videoController =
                    //                 VideoPlayerController.networkUrl(Uri.parse('$node$videoUrl'));
                    final videoController = VideoPlayerController.networkUrl(
                        // Uri.parse('$node$videoUrl'));
                        Uri.parse(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
                    return FutureBuilder(
                      future: videoController.initialize(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return GestureDetector(
                            onTap: () {
                              // if (videoController.value.isPlaying) {
                              //   videoController.pause();
                              // } else {
                              //   videoController.play();
                              // }
                              print("sxsdscxdscxsdcs");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Myvideospage2()),
                              );
                            },
                            child: Card(
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: VideoPlayer(videoController),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          print('Error initializing video: ${snapshot.error}');
                          return const Card(
                            child: Center(
                              child: Text('Video Playback Error'),
                            ),
                          );
                        } else {
                    
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Card(
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  color: Colors
                                      .grey, // Customize the skeleton loader appearance
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
    );
  }
}
