import 'package:chef_frontend/common_widget/DMsans_text/dmsanstext.dart';
import 'package:chef_frontend/views/dashboard/calender/add_task_bar.dart';
import 'package:chef_frontend/views/dashboard/calender/calendarbutton.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarView extends StatefulWidget {
  static String route = '/calendar/page';
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      // appBar: ,
      body: Column(
        children: [
           _addTaskBar(),
          _addDateBar(),
          
           
      ],
      ),
    );

  }

_addDateBar(){
  return Container(
            margin:  EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height:100,
              width:80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.red,
              selectedTextColor:Colors.white,
              dateTextStyle: 
              GoogleFonts.dmSans(
                textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              ),
                dayTextStyle: 
              GoogleFonts.dmSans(
                textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              ),
               monthTextStyle: 
              GoogleFonts.dmSans(
                textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              ),
              onDateChange: (date){
                _selectedDate = date;

              },
            ),
           );
}















  _addTaskBar(){
    return
       Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
               width: 200,
                // margin: const EdgeInsets.symmetric(horizontal:  20),
                child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
        
        
                  children: [
                  Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: dmSansBoldTextStyle,
                  
                  
                  
                  ),
                
                  Text("Today", 
                  style: dmSansBoldTextStyle ,
                  ),
                
                  ],
                ),
              ),
        
             MyButton(label: "+ Add Task", onTap: ()=>Get.to(AddTaskPage()))
        
        
        
        
        
        
        
        
        
        
        
        
        
            ],
          ),
        );
    
  }
}