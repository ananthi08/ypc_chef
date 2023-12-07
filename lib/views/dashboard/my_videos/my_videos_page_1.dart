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
          print('videosvideos$videos');
        });
      }
    } catch (e) {
      print('Error fetching and displaying videos: $e');
    }
  }

  bool showSearchResults = false;
  final TextEditingController searchController = TextEditingController();

  void filterSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        showSearchResults = false;
      } else {
        showSearchResults = true;
      }
    });
  }

  List<Map<String, dynamic>> getFilteredVideos(String query) {
    return videos
        .where((video) =>
            video['text'].toLowerCase().contains(query.toLowerCase()))
        .toList();
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
              Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 110,
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
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/mxplayer.jpeg"),
                                const SizedBox(height: 10),
                                const Text(
                                  'My Videos',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  onChanged: filterSearchResults,
                                  controller: searchController,
                                  decoration: const InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (showSearchResults)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  getFilteredVideos(searchController.text)
                                      .length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(getFilteredVideos(
                                      searchController.text)[index]['text']),
                                  onTap: () {
                                    print(
                                        'Selected: ${getFilteredVideos(searchController.text)[index]['text']}');
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),

              //  Expanded(
              // child:
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                                             Align(
  alignment: Alignment.centerLeft,
  child: Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child:const Text(
      "Approved Videos",
      style: TextStyle(
        color: Colors.white, 
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 2 / 2),
                        itemCount: videos.length,
                        itemBuilder: (context, index) {
                          final videoUrl = videos[index]['videoUrl'];
                          final adminApproved = videos[index]['adminApproved'];
                          final videoController =
                              VideoPlayerController.networkUrl(
                            Uri.parse(
                                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                          );

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FutureBuilder(
                                future: videoController.initialize(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return GestureDetector(
                                      onTap: () {
                                        print("sxsdscxdscxsdcs");
                                        Navigator.pushNamed(
                                            context, Myvideospage2.route);
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: VideoPlayer(
                                                      videoController)),
                                            ),
                                          ),

                                          Expanded(
                                            child: Text(
                                              videos[index]['text'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                          // ),
                                          const Expanded(
                                            flex: 1,

                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Review:'),
                                                Icon(Icons.star,
                                                    color: Colors.amber,
                                                    size: 8.0),
                                                Icon(Icons.star,
                                                    color: Colors.amber,
                                                    size: 8.0),
                                                Icon(Icons.star,
                                                    color: Colors.amber,
                                                    size: 8.0),
                                                Icon(Icons.star,
                                                    color: Colors.amber,
                                                    size: 8.0),
                                                Icon(Icons.star,
                                                    color: Colors.amber,
                                                    size: 8.0),
                                              ],
                                              // ),
                                            ),
                                            // ],
                                          ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return const Card(
                                      child: Center(
                                        child: Text('Video Playback Error'),
                                      ),
                                    );
                                  } else {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Column(
                                        children: [
                                          Card(
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              color: Colors.grey,
                                              height: 20.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  color: Colors.grey,
                                                  width: 80.0,
                                                  height: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }
                                // },
                                ),
                          );
                        },
                      ),
                      // ),

                      // ///////////this is not approved

                      // GridView.builder(
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   gridDelegate:
                      //       const SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 3,
                      //   ),
                      //   itemCount: videos.length,
                      //   itemBuilder: (context, index) {
                      //     final videoUrl = videos[index]['videoUrl'];
                      //     final adminApproved = videos[index]['adminApproved'];
                      //     final videoController =
                      //         VideoPlayerController.networkUrl(
                      //       Uri.parse(
                      //           'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                      //     );

                      //     // Check if the video is admin approved
                      //     if (adminApproved == 1) {
                      //       return FutureBuilder(
                      //         future: videoController.initialize(),
                      //         builder: (context, snapshot) {
                      //           if (snapshot.connectionState ==
                      //               ConnectionState.done) {
                      //             return GestureDetector(
                      //               onTap: () {
                      //                 print("sxsdscxdscxsdcs");
                      //                 Navigator.pushNamed(
                      //                     context, Myvideospage2.route);
                      //               },
                      //               child: Column(
                      //                 children: [
                      //                   Card(
                      //                     shape: RoundedRectangleBorder(
                      //                       borderRadius:
                      //                           BorderRadius.circular(20.0),
                      //                     ),
                      //                     child: AspectRatio(
                      //                       aspectRatio: 16 / 9,
                      //                       child: VideoPlayer(videoController),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Text(
                      //                       videos[index]['text'],
                      //                       style: const TextStyle(
                      //                         fontWeight: FontWeight.bold,
                      //                         fontSize: 13.0,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   const Padding(
                      //                     padding: EdgeInsets.all(8.0),
                      //                     child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       children: [
                      //                         Text('Review:'),
                      //                         Icon(Icons.star,
                      //                             color: Colors.amber,
                      //                             size: 8.0),
                      //                         Icon(Icons.star,
                      //                             color: Colors.amber,
                      //                             size: 8.0),
                      //                         Icon(Icons.star,
                      //                             color: Colors.amber,
                      //                             size: 8.0),
                      //                         Icon(Icons.star,
                      //                             color: Colors.amber,
                      //                             size: 8.0),
                      //                         Icon(Icons.star,
                      //                             color: Colors.amber,
                      //                             size: 8.0),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             );
                      //           } else if (snapshot.hasError) {
                      //             return const Card(
                      //               child: Center(
                      //                 child: Text('Video Playback Error'),
                      //               ),
                      //             );
                      //           } else {
                      //             return Shimmer.fromColors(
                      //               baseColor: Colors.grey[300]!,
                      //               highlightColor: Colors.grey[100]!,
                      //               child: Column(
                      //                 children: [
                      //                   Card(
                      //                     child: AspectRatio(
                      //                       aspectRatio: 16 / 9,
                      //                       child: Container(
                      //                         color: Colors.grey,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Container(
                      //                       color: Colors.grey,
                      //                       height: 20.0,
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.center,
                      //                       children: [
                      //                         Container(
                      //                           color: Colors.grey,
                      //                           width: 80.0,
                      //                           height: 20.0,
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             );
                      //           }
                      //         },
                      //       );
                      //     } else {
                      //       return const Card(
                      //         child: Center(
                      //           child: Text('Video not approved'),
                      //         ),
                      //       );
                      //     }
                      //   },
                      // ),

                      Column(
                        children: [
                         Align(
  alignment: Alignment.centerLeft,
  child: Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Text(
      "Not-Approved Videos",
      style: TextStyle(
        color: Colors.white, 
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

                          GridView.builder(
                          
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 2,
                            ),
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              final videoUrl = videos[index]['videoUrl'];
                              final adminApproved = videos[index]['adminApproved'];
                              final videoController =
                                  VideoPlayerController.networkUrl(
                                Uri.parse(
                                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
                              );
                          
                              // Check if adminApproved is equal to 1
                              if (adminApproved == 1) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FutureBuilder(
                                    future: videoController.initialize(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return GestureDetector(
                                          onTap: () {
                                            print("sxsdscxdscxsdcs");
                                            // Navigator.pushNamed(
                                            //     context, Myvideospage2.route);
                                          },
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                    ),
                                                    child: VideoPlayer(
                                                        videoController),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  videos[index]['text'],
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text('Review:'),
                                                    Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 8.0),
                                                    Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 8.0),
                                                    Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 8.0),
                                                    Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 8.0),
                                                    Icon(Icons.star,
                                                        color: Colors.amber,
                                                        size: 8.0),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Card(
                                          child: Center(
                                            child: Text('Video Playback Error'),
                                          ),
                                        );
                                      } else {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Column(
                                            children: [
                                              Card(
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child: Container(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  color: Colors.grey,
                                                  height: 20.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      color: Colors.grey,
                                                      width: 80.0,
                                                      height: 20.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                );
                              } else {
                                return const Card(
                                  child: Center(
                                    child: Text('Video not approved'),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
// ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 3),
        height: 50,
        width: 50,
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
            color: Color.fromARGB(255, 173, 20, 0),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 240, 240, 240),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
// for home
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Dashboardview.route);
                  },
                  icon: const Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 173, 20, 0),
                  )),

// for cart
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Color.fromARGB(255, 173, 20, 0),
                  )),
// for mail
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Color.fromARGB(255, 173, 20, 0),
                  )),

              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mail,
                    color: Color.fromARGB(255, 173, 20, 0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
