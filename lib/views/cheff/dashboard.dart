import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static String route = '/chef/dashboard';

  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned widget with the row
          Positioned(
            left: 16,
            top: 32,
            child: Row(
              children: [
                Text(
                  'Dashboard ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 23,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images 6.png'),
                  ),
                ),
                // Add a rectangle container
                Container(
                  width: 50, // Adjust the width as needed
                  height: 20, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.blue, // Change the color as needed
                    borderRadius: BorderRadius.circular(5), // Add rounded corners if desired
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
