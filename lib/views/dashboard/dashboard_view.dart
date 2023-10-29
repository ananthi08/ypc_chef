import 'package:chef_frontend/common_widget/bottom_navbar.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/my_videos/my_videos_page_1.dart';
import 'package:flutter/material.dart';

class Dashboardview extends StatefulWidget {
  static String route = '/chef/dashboard';
  const Dashboardview({super.key});

  @override
  State<Dashboardview> createState() => _DashboardviewState();
}

class _DashboardviewState extends State<Dashboardview> {



 final GETchefDetails fetchall_videos = GETchefDetails();
List<Map<String, dynamic>> videos = [];
Set<String> videoUrls = {}; // Set to store unique video URLs

Future<void> fetchAndDisplayVideos() async {
  try {
    final fetchedVideos = await fetchall_videos.fethallvideos();
    if (fetchedVideos != null) {
      setState(() {
        videos = fetchedVideos;
        // Extract and store unique video URLs
        videoUrls = Set<String>.from(videos.map((video) => video['videoUrl']));
        print('tooooooooooooooootal$videos');
      });
    }
  } catch (e) {
    print('Error fetching and displaying videos: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//  theme: new ThemeData(scaffoldBackgroundColor: const Color(#FFEFEF)),
      backgroundColor: const Color.fromARGB(248, 246, 246, 246),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle_rounded,
                              size: 40,
                            ),
                            color: Colors.black87,
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profilepage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  const SizedBox(width: 10),

                            Column(
                              children: [
                                Image.asset("assets/mxplayer.jpeg"),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text('My Videos',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('${videoUrls.length} Videos'),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Myvideospage()),
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  const SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset("assets/receipes1.jpeg"),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text('My Recipes',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('34 Recipes'),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot()),
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  const SizedBox(width: 30),

                            Column(
                              children: [
                                Image.asset("assets/peoples.jpeg"),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text('My customers',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('23 peoples'),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot()),
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  const SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset("assets/calendar.jpeg"),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text('View Schedule',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('23 Payment'),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot()),
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(17),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //  const SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset("assets/payment.jpg"),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text('Payment',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('23 Payment'),
                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot()),
                                );
                              },
                              child: const Text(
                                "See More",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Bottomnavbar(),
    );
  }
}
