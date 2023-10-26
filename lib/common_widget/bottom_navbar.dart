import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({
    super.key, 
    // required MaterialColor backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
      child: NavigationBar(destinations:const [
        NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: Colors.black54,
            ),
            label: 'Notification'),
        NavigationDestination(
            icon: Icon(
              Icons.email,
              color: Colors.black54,
            ),
            label: 'Mail'),
        // NavigationDestination(
        //     icon: Icon(
        //       Icons.feed,
        //       color: Colors.black54,
        //     ),
        //     label: 'Feed'),
      ]),
    );
  }
}
