import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/common_widget/customimage.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/service/GET_services/getting_userfollowed_deatils.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  int followersCount = 4;
  int followingCount = 0;

  @override
  void initState() {
    super.initState();
    getFollowersDetails();
  }

  List<USERFOLLOWMODEL>? followersList;

  Future<void> getFollowersDetails() async {
    GetFollowersDetails followersDetails = GetFollowersDetails();
    List<USERFOLLOWMODEL>? followers =
        await followersDetails.getDetailsOfFollowers();

    if (followers != null) {
      for (var follower in followers) {
        if (follower != null) {
          print("${follower.userName}");
        }
      }

      setState(() {
        followersList = followers;
      });
    } else {}
  }

  final GETchefDetails _chefDetails = GETchefDetails();
  late String userId = '';
  late String userName = '';
  late String email = '';

  String imageUrl = '';
  Future<void> getChefDetails() async {
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
      }
      // print("chefDetailschefDetailschefDetails$chefDetails");
    } catch (e) {
      print("Error fetching user details: $e");
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
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_backspace_sharp),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomSVGImage(
                              path: "assets/Resetpassword.svg",
                              height: 50,
                              bordercolor: Colors.black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             Text(
                              'My Customers',
                              style: GoogleFonts.dmSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
             
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      (followersList?.length ?? 0).toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        primary: CustomColor.myRedColor,
                                        minimumSize: const Size(135, 40),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Remove Following Customer'),
                                              content: const Text(
                                                  'Your custom text here!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('Following',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


                 const  Padding(
                     padding:  EdgeInsets.all(8.0),
                     child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                      Text(
                                        "Following",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ])
                                  ]
                                  ),
                   ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: followersList?.length ?? 0,
                itemBuilder: (context, index) {
                  USERFOLLOWMODEL follower = followersList![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Color.fromARGB(255, 241, 241, 241),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: follower.imageUrl!.isNotEmpty
                                  ? NetworkImage('$node${follower.imageUrl}')
                                  : const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    follower.userName ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      primary: CustomColor.myRedColor,
                                      minimumSize: const Size(135, 35),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Remove Following Customer'),
                                            content: const Text(
                                                'Your custom text here!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Following',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
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
