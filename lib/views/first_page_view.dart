import 'package:chef_frontend/common_widget/custom%20GREEN/customgreen.dart';
import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Firstpage extends StatelessWidget {
  static String route = '/';
  const Firstpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: screenWidth * 1,
                height: screenHeight * 1,
                color: const Color.fromARGB(31, 255, 255, 255),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/Animation - 1698662925528 (1).json',
                      height: 500,
                      width: 300,
                      animate: true,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: CustomColor.myGreenColor,
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()),
                        );
                      },
                      child: const Text('Get started'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
