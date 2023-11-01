import 'package:chef_frontend/common_widget/DMsans_text/dmsanstext.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: ,
      body: Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal:  20),
              child: Column( 
crossAxisAlignment: CrossAxisAlignment.start,


                children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: dmSansBoldTextStyle,
                
                
                
                ),
              
                Text("Today",
                style: dmSansBoldTextStyle,
                ),
              
                ],
              ),
            )
          ],
        )
      ],),
    );
  }
}