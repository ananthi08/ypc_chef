import 'package:chef_frontend/common_widget/customimage.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  int followersCount = 123; 
  int followingCount = 456; 

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
                        icon: const Icon(Icons.arrow_back),
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
                            const Text(
                              'My Customers',
                              style: TextStyle(
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
                                      followingCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    Text(
                                      followersCount.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
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
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Card(
//     elevation: 5,
//     color: Colors.white, 
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12.0),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 20,
//             backgroundImage: NetworkImage(
//                 "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
//           ),
//           const SizedBox(width: 10),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 'User Name',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 90),
//               ElevatedButton(
//                 onPressed: () {
//                 
//                 },
//                 child: const Text('Follow'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   ),
// ),




               Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    color: Colors.white, 
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
            ),
            const SizedBox(width: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'User Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 90),
                ElevatedButton(
                  onPressed: () {
                 
                  },
                  child: const Text('Follow'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  ),
),







            ],
          ),
        ),
      ),
    );
  }
}
