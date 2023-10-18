import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  static String route = '/';
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/chef.jpg'),
              fit: BoxFit.contain,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth * 0.4,
              height: screenHeight * 0.06,
              margin: EdgeInsets.only(bottom: screenHeight * 0.02),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.0125),
                  ),
                  padding: const EdgeInsets.all(0),
                  elevation: 0,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 38, 0, 0.4),
                        Color.fromRGBO(247, 177, 0, 0.475),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(screenHeight * 0.0125),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 3, 236),
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
