// import 'dart:io';

import 'dart:developer';

import 'package:flutter/material.dart';

class Recipes extends StatefulWidget {
  // static String route = '/user/Recipes';
  static String route = '/chef';
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  void initState() {
    super.initState();
    log("logging first page");
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () async {},
                      ),
                      // Container(
                      //   height: 50.0,
                      //   width: screenWidth * 0.7,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //     child: StepProgressIndicator(
                      //       roundedEdges: const Radius.circular(20),
                      //       totalSteps: 5,
                      //       currentStep: currentStep,
                      //       size: 8,
                      //       padding: 0,
                      //       selectedColor: Colors.red.shade700,
                      //       unselectedColor: Colors.grey.shade300,
                      //     ),
                      //   ),
                      // ),i
                      Padding(
                        padding: const EdgeInsets.fromLTRB(160, 0, 0, 0),
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.message),
                              color: Colors.black87,
                              onPressed: () async {},
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.send),
                              color: Colors.black87,
                              onPressed: () async {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/chef_logo.png"),
                        radius: 32,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Cat Cora',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Catcora@gmail,com',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              primary: const Color(0xFFA51C05),
                              minimumSize: const Size(130, 40),
                            ),
                            onPressed: () {},
                            child: const Text('Follow '),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Expanded(
                //   flex: 1,
                //   child: Divider(
                //     color: Colors.grey,
                //     thickness: 1,
                //   ),
                // ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '232',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' \nrecipes',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            '43',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 05,
                          ),
                          Column(
                            children: [
                              Text(
                                'following',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '132',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' \nfollowers',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Divider(
                //     color: Colors.grey,
                //     thickness: 1,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AccountCreate()),
                        //   );
                        // },
                        child: const Text(
                          "Recipes",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const AccountCreate()),
                            //   );
                            // },
                            child: const Text(
                              "About",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: Colors.red,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/mixveg.jpeg",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 135,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Methi Malai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  'Paneer Recipes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/pannermasala.jpeg",
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 135,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Mix Veg Recipe',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    'Curry Recipes',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 20,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/mixveg.jpeg",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 135,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Mushroom Tikka',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  'Mushroom Recipes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/pannermasala.jpeg",
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 135,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Pulao',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15, 120, 0, 0),
                                  child: Text(
                                    'Rice Recipes',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/mixveg.jpeg",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 135,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Ghee Rice',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  'Rice Recipes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/pannermasala.jpeg",
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 135,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Aloo Paratha',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    'Breakfast Recipes',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue.shade100,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(destinations: [
            const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            const NavigationDestination(
                icon: Icon(Icons.category), label: 'Category'),
            const NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
            //  NavigationDestination(
            //         icon: Badge(
            //           badgeContent: Text(
            //             '2',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //           badgeColor: Colors.red,
            //           child: Icon(Icons.chat),
            //         ),
            //         label: 'Chat',
            //       ),
            const NavigationDestination(icon: Icon(Icons.feed), label: 'Feed'),
          ]),
        ),
      ),
    );
  }
}
