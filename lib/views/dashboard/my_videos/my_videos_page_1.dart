import 'package:chef_frontend/common_widget/custom_navbar/nav_model.dart';
import 'package:chef_frontend/common_widget/customimage.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/feed/FEED.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:chef_frontend/views/dashboard/my_videos/video_page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  List<Map<String, dynamic>> getFilteredVideoss(bool lightValue) {
    return videos
        .where((video) => video['adminApproved'] == (lightValue ? 1 : 0))
        .toList();
  }

  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  String selectedFilter = 'All';
  List<Map<String, dynamic>> getSortedVideoss(String filter) {
    if (filter == 'All') {
      return videos;
    } else {
      return videos.where((video) => video['productType'] == filter).toList();
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
              Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: 110,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.keyboard_backspace_sharp),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dashboardview(),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/mxplayer.jpeg"),
                              const SizedBox(width: 15),
                               Text(
                                'My Videos',
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
                                  onTap: () async {
                                    print(
                                        'Selected: ${getFilteredVideos(searchController.text)[index]['text']}');

                                    print(
                                        '${getFilteredVideos(searchController.text)[index]['videoUrl']}');
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.setString(
                                        'videoUrl',
                                        getFilteredVideos(
                                                searchController.text)[index]
                                            ['videoUrl']);

                                    String? selectedVideoUrl =
                                        prefs.getString('videoUrl');
                                    if (selectedVideoUrl != null) {
                                      print(
                                          "Selected video URL: $selectedVideoUrl");
                                    } else {
                                      print(
                                          "No selected video URL found in shared preferences.");
                                    }

                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(
                                        context, Myvideospage2.route);
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),

// this is for toggle approved & not-approved
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // IconButton(
                    //   icon: Icon(Icons.sort),
                    //   // onPressed: () {
                    //   //   setState(() {

                    //   //   });
                    //   // },

                    //   onPressed: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: const Text('Sort By'),
                    //           content: Column(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               ListTile(
                    //                 title: const Text('All'),
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedFilter = 'All';
                    //                   });
                    //                   Navigator.pop(context);
                    //                 },
                    //               ),
                    //               ListTile(
                    //                 title: const Text('Veg'),
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedFilter = 'Veg';
                    //                   });
                    //                   Navigator.pop(context);
                    //                 },
                    //               ),
                    //               ListTile(
                    //                 title: const Text('Non-veg'),
                    //                 onTap: () {
                    //                   setState(() {
                    //                     selectedFilter = 'Non-veg';
                    //                   });
                    //                   Navigator.pop(context);
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          thumbIcon: thumbIcon,
                          value: light1,
                          onChanged: (bool value) {
                            setState(() {
                              light1 = value;
                              print('light1light1light1$light1');
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
// ///////////////////////////////////////////

              //  Expanded(
              // child:

              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 2 / 2),
             
                        itemCount: getFilteredVideoss(light1).length,
                    
                        itemBuilder: (context, index) {
                          // final videoUrl = videos[index]['videoUrl'];
                          final videoUrl =
                              getFilteredVideoss(light1)[index]['videoUrl'];
                          final adminApproved = videos[index]['adminApproved'];
                          // final videoController =
                          //     VideoPlayerController.networkUrl(
                          //   Uri.parse(

                          //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
                          //       // 'https://www.youtube.com/watch?v=Bh60dU0Phd8'
                          //       ),
                          // );


                            final videoController = VideoPlayerController.networkUrl(
                          Uri.parse(
                              'https://ypc123.s3.ap-south-1.amazonaws.com/Crab_Biryani_How_To_Make_Crab_Rice_Quick_And_Easy_Crab_Rice_%E0%A4%9A%E0%A4%BF%E0%A4%82%E0%A4%AC%E0%A5%8B%E0%A4%B0%E0%A5%80.mp4'));
                          // (adminApproved == 0 && light1 ) ;

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FutureBuilder(
                                future: videoController.initialize(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return GestureDetector(
                                      onTap: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString('videoUrl', videoUrl);

                                        String? selectedVideoUrl =
                                            prefs.getString('videoUrl');
                                        if (selectedVideoUrl != null) {
                                          print(
                                              "Selected video URL: $selectedVideoUrl");
                                        } else {
                                          print(
                                              "No selected video URL found in shared preferences.");
                                        }

                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamed(
                                            context, Myvideospage2.route);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 6,
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
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  videos[index]['text'],
                                                  style:  GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                // Food type icon
                                                if (videos[index]
                                                        ['productType'] ==
                                                    'Veg')
                                                  const CustomSVGImage(
                                                    path: "assets/veg.svg",
                                                    height: 15,
                                                    bordercolor: Colors.black,
                                                  )
                                                else if (videos[index]
                                                        ['productType'] ==
                                                    'Non-Veg')
                                                  const CustomSVGImage(
                                                    path: "assets/nonveg.svg",
                                                    height: 15,
                                                    bordercolor: Colors.black,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Likes: ${videos[index]['likes'] ?? '0'}',
                                                  style:  GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cuisines: ${videos[index]['nationalCuisine'] ?? ''}',
                                                  style:  GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
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
                          //  }
                        },
                      ),
                    ],
                  ),
                ),
              )

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
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.shopping_cart_checkout,
              //       color: Color.fromARGB(255, 173, 20, 0),
              //     )),
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
