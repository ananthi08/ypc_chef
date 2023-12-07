// import 'package:chef_frontend/common_widget/DMsans_text/dmsanstext.dart';
import 'package:chef_frontend/common_widget/bottom_navbar.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/dashboard/calender/calender.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/my_customers/customers.dart';
import 'package:chef_frontend/views/dashboard/my_videos/my_videos_page_1.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
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


@override
  void initState() {
    super.initState();

    fetchAndDisplayVideos();
    
  }


Future<void> fetchAndDisplayVideos() async {
  try {
    final fetchedVideos = await fetchall_videos.fethallvideos();
    if (fetchedVideos != null) {
      setState(() {
        videos = fetchedVideos;
        // Extract and store unique video URLs
        videoUrls = Set<String>.from(videos.map((video) => video['videoUrl']));
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
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans'),
                     
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Myvideospage()),
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
              Column(
                children: [
                  Image.asset("assets/mxplayer.jpeg"),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text('My Videos',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('${videoUrls.length} Videos'),
                ],
              ),
              const Text(
                "See More",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
            MaterialPageRoute(builder: (context) => const CustomersPage()),
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
              Column(
                children: [
                  Image.asset("assets/peoples.jpeg"),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text(
                    'My Customers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('23 people'),
                ],
              ),
              const Text(
                "See More",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
            MaterialPageRoute(builder: (context) => const CustomersPage()),
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
              Column(
                children: [
                  Image.asset("assets/peoples.jpeg"),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text(
                    'My Followers',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('23 people'),
                ],
              ),
              const Text(
                "See More",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),
                // Center(
                //   child: Column(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(17),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(16)),
                //         height: 120,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             //  const SizedBox(width: 30),
                //             Column(
                //               children: [
                //                 Image.asset("assets/calendar.jpeg"),
                //                 const SizedBox(
                //                   height: 1,
                //                 ),
                //                 const Text('View Schedule',
                //                     style:
                //                         TextStyle(fontWeight: FontWeight.bold)),
                //                 const SizedBox(
                //                   height: 8,
                //                 ),
                //                 const Text('23 Payment'),
                //               ],
                //             ),

                //             GestureDetector(
                //               onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => const CalendarView(),
                //                 ),
                //               );
                //               },
                //               child: const Text(
                //                 "See More",
                //                 style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 30),

                
                Center(
  child: Column(
    children: [
      GestureDetector(
        onTap: () {
       
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
              Column(
                children: [
                  Image.asset("assets/payment.jpg"),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text(
                    'Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('23 Payment'),
                ],
              ),
              const Text(
                "See More",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
        shape: CircularNotchedRectangle(),
        color:const Color.fromARGB(255, 240, 240, 240),


      child: Container(

        height: 50,

        child: Row(
          
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: 
        [
// for home
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Dashboardview.route);
          },
          icon: Icon(Icons.home_filled,color: Color.fromARGB(255, 173, 20, 0),)
          ),

// for cart
            IconButton(onPressed: (){
            
          }, 
          
          icon: Icon(Icons.shopping_cart_checkout,color: Color.fromARGB(255, 173, 20, 0),)
          ),
// for mail
          IconButton(onPressed: (){
            
          }, 
          
          icon: Icon(Icons.notifications_active,color:Color.fromARGB(255, 173, 20, 0),)
          ),

              IconButton(onPressed: (){
            
          }, 
          
          icon: Icon(Icons.mail,color: Color.fromARGB(255, 173, 20, 0),)
          ),



        ],
        ),


      ),
      
      
       ),

    );
  }
}
