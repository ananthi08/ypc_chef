// import 'dart:io';

import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class Categoryreceipe extends StatefulWidget {
  static String route = '/chef/Categoryreceipe';
  // static String route = '/';
  const Categoryreceipe({super.key});

  @override
  State<Categoryreceipe> createState() => _CategoryreceipeState();
}

class _CategoryreceipeState extends State<Categoryreceipe> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  offset:const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/category/chickenbiriyani.png",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 360,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                     const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Chicken Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                     const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '150 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
                    
                  ],
                ),
               
                const SizedBox(
                  height: 20,
                ),
              
               const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                    
                       SizedBox(
                        width: 150,
                      ),
                   
                    ],
                  ),
                ),
              
                const SizedBox(
                  height: 10,
                ),
                // Text('Sort By'),
               const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                   
                  children: [
                     SizedBox(
                  width: 30,
                ),
                    Column(
                      children: [Text('Sort By')],
                      
                    ),
                     SizedBox(
                  width: 190,
                ),
                     Column(
                      
                      children: [Text('Most Popular')],
                    )
                  ],
                ),
                  const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  "assets/category/chickenbiriyani.png",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 170,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Chicken Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '150 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
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
                                    "assets/category/muttonbiriyani.png",
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 170,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Mutton Briyani',
                                    style:  GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    '100 Recipes',
                                    style:  GoogleFonts.dmSans(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  offset:const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/category/pannerbiriyani.jpg",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 170,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Panner Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '20 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
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
                                    offset:const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/category/rawtherbiriyani.png",
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 170,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Rawther Briyani',
                                    style:  GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 120, 0, 0),
                                  child: Text(
                                    '60 Recipes',
                                    style:  GoogleFonts.dmSans(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  "assets/category/65biriyani.png",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 170,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  '65 Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '40 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
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
                                    "assets/category/amburbiriyani.png",
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 170,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Ambur Briyani',
                                    style:  GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    '50 Recipes',
                                    style:  GoogleFonts.dmSans(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  offset:const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/category/mushroombiriyani.png",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 170,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Mushroom Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                     const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '40 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
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
                                    offset:const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/category/prawnbiriyani.png",
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 170,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Prawn Briyani',
                                    style:  GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    '50 Recipes',
                                    style:  GoogleFonts.dmSans(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                                  offset:const Offset(0, 3),
                                )
                              ]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    10), // Set the border radius here
                                child: Image.asset(
                                  "assets/category/fishbiriyani.png",
                                  fit: BoxFit.cover,
                                  height: 140,
                                  width: 170,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                child: Text(
                                  'Fish Briyani',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                child: Text(
                                  '40 Recipes',
                                  style:  GoogleFonts.dmSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    // const SizedBox(
                    //   width: 45,
                    // ),
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
                                    offset:const Offset(0, 3),
                                  )
                                ]),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set the border radius here
                                  child: Image.asset(
                                    "assets/category/biriyani.png",
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: 170,
                                  ),
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                 Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 100, 0, 0),
                                  child: Text(
                                    'Dindigul Briyani',
                                    style:  GoogleFonts.dmSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                 Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 120, 0, 0),
                                  child: Text(
                                    '50 Recipes',
                                    style:  GoogleFonts.dmSans(
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
            

                
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBarTheme(
          
          data: NavigationBarThemeData(
              indicatorColor: const Color.fromARGB(255, 232, 251, 187),
              
                labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
           NavigationDestination(
                icon: Icon(Icons.category), label: 'Category'),
            NavigationDestination(icon: Icon(Icons.chat), label: 'Chat'),
           
            NavigationDestination(icon: Icon(Icons.feed), label: 'Feed'),
          ]),
        ),
      ),
    );
  }
}
