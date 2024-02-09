// import 'package:chef_frontend/common_widget/DMsans_text/dmsanstext.dart';
import 'package:chef_frontend/common_widget/bottom_navbar.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/dashboard/calender/calender.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/my_customers/customers.dart';
import 'package:chef_frontend/views/dashboard/my_videos/my_videos_page_1.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void initState() {
    super.initState();
    getUserId();
    fetchAndDisplayVideos();
  }

  late String userId = '';
  late String userName = '';
  late String email = '';
  final GETchefDetails _chefDetails = GETchefDetails();

  String imageUrl = '';
  Future<void> getUserId() async {
    try {
      final chefDetails = await _chefDetails
          .getchefDetails(context: context, selectedCuisineIds: []);
      if (chefDetails != null) {
        setState(() {
          userId = chefDetails['id'] ?? '';
          userName = chefDetails['userName'] ?? '';
          email = chefDetails['email'] ?? '';
          imageUrl = chefDetails['imageUrl'] ?? '';
        });
        // print(chefDetails);
        // log(email);
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  Future<void> fetchAndDisplayVideos() async {
    try {
      final fetchedVideos = await fetchall_videos.fethallvideos();
      if (fetchedVideos != null) {
        setState(() {
          videos = fetchedVideos;
          // Extract and store unique video URLs
          videoUrls =
              Set<String>.from(videos.map((video) => video['videoUrl']));
          // print('tooooooooooooooootal$videos');
        });
      }
    } catch (e) {
      print('Error fetching and displaying videos: $e');
    }
  }

  double height = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
                     Text(
                      'Dashboard',
                      style: GoogleFonts.dmSans(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          IconButton(
                            icon: CircleAvatar(
                              radius: 20,
                              backgroundImage: imageUrl.isNotEmpty
                                  ? NetworkImage('$node$imageUrl')
                                  : const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                              backgroundColor: Colors.black,
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
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align items to the start
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Myvideospage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/mxplayer.jpeg"),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                     Text(
                                      'My Videos',
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.bold,
                                         ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${videoUrls.length} Videos',
                                style:  GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CustomersPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/peoples.jpeg"),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                     Text(
                                      'My Followers',
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                               Text(
                                '23 people',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                   ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CustomersPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/calendar.jpeg"),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                     Text(
                                      'View Schedule',
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.bold,
                                         ),
                                    ),
                                  ],
                                ),
                              ),
                               Text(
                                '5 Tasks',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                   ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/payment.jpg"),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                     Text(
                                      'Payment',
                                      style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.bold,
                                         ),
                                    ),
                                  ],
                                ),
                              ),
                               Text(
                                '23 Payment',
                                style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    ),
                              ),
                            ],
                          ),
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
        // ignore: sized_box_for_whitespace
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
              //     icon:const Icon(
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
