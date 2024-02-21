// import 'package:chef_frontend/common_widget/token_manager.dart';
import 'dart:math';

import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/common_widget/token_manager.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboard_editprofile_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/first_page_view.dart';
// import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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






  SignupApi delete = SignupApi();

  press() {
    delete.deleteAccount(context: context);
  }

  removeIdFromPreferencesUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("chefId");
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_backspace_sharp),
            color: Colors.black,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Profile",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: CustomColor.myRedColor,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),

              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: imageUrl.isNotEmpty
                          ? NetworkImage('$node$imageUrl')
                          : const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                    ),
                    // CircleAvatar(

                    //   backgroundImage: NetworkImage('$node$imageUrl'),
                    //   radius: 30.0,
                    // ),
                  ),
                ],
              ),
              Text(
                userName,
                style: GoogleFonts.dmSans(
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
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: CustomColor.myRedColor,
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
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.dmSans(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Account",
                      style: GoogleFonts.dmSans(
                        color: CustomColor.myRedColor,
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
                              //  color: CustomColor.myRedColor,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Security",
                                style: GoogleFonts.dmSans(
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
                              // color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Notification",
                                style: GoogleFonts.dmSans(
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
                              //  color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Privacy",
                                style: GoogleFonts.dmSans(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Support & About",
                      style: GoogleFonts.dmSans(
                        color: CustomColor.myRedColor,
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
                              //  color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "My Subscription",
                                style: GoogleFonts.dmSans(
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
                              //  color: CustomColor.myRedColor,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Help & support",
                                style: GoogleFonts.dmSans(
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
                              //  color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Term and policies",
                                style: GoogleFonts.dmSans(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      "Actions",
                      style: GoogleFonts.dmSans(
                        color: CustomColor.myRedColor,
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
                              //  color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Report a Problem",
                                style: GoogleFonts.dmSans(
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
                              Icons.account_circle,
                              //  color: CustomColor.myRedColor,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            GestureDetector(
                              child: Text(
                                "Add account",
                                style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),




                        GestureDetector(
                      onTap: () async {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: const Text("Logout"),
                      //         content: const Text(
                      //             "Are you sure you want to logout?"),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () async {
                      //               Navigator.of(context)
                      //                   .pop(); // Close the dialog
                      //               // Call your logout function
                      //               await removeIdFromPreferencesUserId();

                      //                 Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Firstpage(),
                      //   ),
                      // );
                                
                      //             },
                      //             child: Text(
                      //               "Yes",
                      //               style: GoogleFonts.dmSans(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w700,
                      //                 color: Colors.black87,
                      //               ),
                      //             ),
                      //           ),
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context)
                      //                   .pop(); // Close the dialog
                      //             },
                      //             child: Text(
                      //               "No",
                      //               style: GoogleFonts.dmSans(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w700,
                      //                 color: Colors.black87,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );





showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 255, 255, 255)],
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.logout,
                  size: 50,
                  color: CustomColor.myRedColor,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Are you sure you want to logout?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop(); // Close the dialog
                        // Call your logout function
                        await removeIdFromPreferencesUserId();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Firstpage(),
                          ),
                        );
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: CustomColor.myRedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);


                      },
                      child: Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // const Icon(
                                //   Icons.account_circle,
                                //   color: Color.fromRGBO(84, 76, 76, 1),
                                // ),
                                Container(
                                  width: 40,
                                  child: SvgPicture.asset(
                                    "assets/icons/logout.svg",
                                  ),
                                ),

                                const SizedBox(width: 35),
                                Text(
                                  "Log Out",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            // const Icon(
                            //   Icons.chevron_right_outlined,
                            //   color: Colors.black87,
                            // ),
                          ],
                        ),
                      ),
                    ),
                      GestureDetector(
                      onTap: () async {




                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: const Text("Delete"),
                        //       content: const Text(
                        //           "Are you sure you want to delete your account ?"),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () async {
                        //             // Navigator.of(context);
                        //             press();
                        //             await removeIdFromPreferencesUserId();
                        //             // Call your delete function
                        //           },
                        //           child: Text(
                        //             "Yes",
                        //             style: GoogleFonts.dmSans(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w700,
                        //               color: Colors.black87,
                        //             ),
                        //           ),
                        //         ),
                        //         TextButton(
                        //           onPressed: () {
                        //             Navigator.of(context)
                        //                 .pop(); // Close the dialog
                        //           },
                        //           child: Text(
                        //             "No",
                        //             style: GoogleFonts.dmSans(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w700,
                        //               color: Colors.black87,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );



                        showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Are you sure you want to delete your account?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        press();
                        await removeIdFromPreferencesUserId();
                        Navigator.of(context).pop(); // Close the dialog
                        // Call your delete function
                        press();
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);





                      },
                      child: Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.delete_outlined,
                                  size: 31,
                                  color: Color.fromRGBO(84, 76, 76, 1),
                                ),
                                // Container(
                                //   width: 40,
                                //   child: IconButton(
                                //     icon: 
                                   
                                //        const Icon(Icons.delete_outlined,
                                //           size: 33),
                                  
                                //     onPressed: () {},
                                //   ),
                                  // child: SvgPicture.asset(
                                  
                                  //   "assets/2.svg",
                                  // ),
                                // ),

                                const SizedBox(width: 35),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Delete Account",
                                    style: GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // const Icon(
                            //   Icons.chevron_right_outlined,
                            //   color: Colors.black87,
                            // ),
                          ],
                        ),
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
        ));
  }
}
