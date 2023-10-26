import 'package:chef_frontend/common_widget/custom%20navbar/nav_bar.dart';
import 'package:chef_frontend/common_widget/custom%20navbar/nav_model.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/feed/FEED.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
// import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';

class Myvideospage extends StatefulWidget {
  static String route = '/chef/videos/1';

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
    items = [
      NavModel(
        page: const Dashboardview(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const Feed(),
        navKey: messageNavKey,
      ),
      // NavModel(
      //   page: const TabPage(tab: 3),
      //   navKey: notificationNavKey,
      // ),
      // NavModel(
      //   page: const TabPage(tab: 4),
      //   navKey: profileNavKey,
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blue.shade100,
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
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
                        const Text('My Videos',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                width: 3, color: Color.fromARGB(255, 169, 169, 169)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.green,
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },
      ),
    );
  }
}
