// import 'package:chef_frontend/common_widget/token_manager.dart';
import 'dart:math';

import 'package:chef_frontend/common_widget/token_manager.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboard_editprofile_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/first_page_view.dart';
// import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  static String route = '/chef/dashboard/Profilepage';
  const Profilepage({super.key});
  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  late String userId = '';
  late String userName = '';
  late String email = '';
  final GETchefDetails _chefDetails = GETchefDetails();

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    try {
      final chefDetails = await _chefDetails
          .getchefDetails(context: context, selectedCuisineIds: []);
      if (chefDetails != null) {
        setState(() {
          userId = chefDetails['id'] ?? '';
          userName = chefDetails['userName'] ?? '';
          email = chefDetails['email'] ?? '';
        });
      // print(chefDetails);
          // log(email);

      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboardview(
                 
                ),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Profile",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E4D52),
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/chef_logo.png"),
            ),
            Text(
              userName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              email,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                primary: const Color(0xFF3E4D52),
                minimumSize: const Size(200, 40),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Editprofile(),
                  ),
                );
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      color: Color(0xFF3E4D52),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              // padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.security,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Security",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.notifications,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      // margin: const EdgeInsets.symmetric(
                      //     vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lock,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Privacy",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
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
            // const SizedBox(
            //   height: 20,
            // ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Support & About",
                    style: TextStyle(
                      color:Color(0xFF3E4D52),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 30,                 
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.subscriptions,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "My Subscription",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.question_mark_outlined,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Help & support",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      // margin: const EdgeInsets.symmetric(
                      //     vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.description,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Term and policies",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
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
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Actions",
                    style: TextStyle(
                      color:Color(0xFF3E4D52),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 30,                    
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.report_problem,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Report a Problem",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 30,                    
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle ,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Add account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                             onTap: () async {
                      await TokenManager.clearUserToken();
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Firstpage(),
                        ),
                      );
                    },
                            child: const Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
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




            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.category_sharp), label: 'Category'),
          NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.feed), label: 'Feed'),
        ]),
      ),
    );
  }
}
