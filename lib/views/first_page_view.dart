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
              fit: BoxFit.cover,
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
                        Color.fromRGBO(156, 29, 6, 0.4),
                        Color.fromRGBO(207, 163, 50, 0.478),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(screenHeight * 0.0125),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
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
