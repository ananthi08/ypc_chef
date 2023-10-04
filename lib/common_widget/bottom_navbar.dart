import 'package:flutter/material.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
          const  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
              Icons.category,
              color: Colors.black54,
            ),
            label: 'Category'),
        NavigationDestination(
            icon: Icon(
              Icons.chat,
              color: Colors.black54,
            ),
            label: 'Chat'),
        NavigationDestination(
            icon: Icon(
              Icons.feed,
              color: Colors.black54,
            ),
            label: 'Feed'),
      ]),
    );
  }
}
