// ignore_for_file: prefer_final_fields

import 'package:chef_frontend/views/dashboard/calender/calendar_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class AddTaskPage extends StatefulWidget {

  static String route = '/calendar/page1';

  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime ="9.30 PM";
  String _startTime = DateFormat('hh:mm a'). format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
          children: [

            const Text("Add Task",
           
            ),

   const MyInputField(title: 'Title', hint: 'Enter your title'),
   const MyInputField(title: 'Note', hint: 'Enter your note'),
  MyInputField(title: 'Date', hint: DateFormat.yMd().format(_selectedDate),
  widget: IconButton(
    icon: const Icon(Icons.calendar_today_outlined),
    color: Colors.grey,
    onPressed:(){
   _getDateFromUser() ;
  } ),
  ),
  Row(
    children:  [
      Expanded(
        child: MyInputField(
        title: "Start Date",
        hint: _startTime ,
        widget: IconButton(onPressed: (){

        }, icon: const Icon(
          Icons.access_time_rounded,
          color: Colors.grey,
        )),
      )),
      const SizedBox(width: 12,),
        Expanded(
        child: MyInputField(
        title: "End Date",
        hint: _endTime ,
        widget: IconButton(onPressed: (){

        }, icon: const Icon(
          Icons.access_time_rounded,
          color: Colors.grey,
        )),
      ))
    ],
  )


          ],
        )),
      ),
    );
  }

  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      // backgroundColor: Color.fromARGB(136, 34, 5, 5),
      leading: GestureDetector(
        onTap: () {
           Get.back();
        },
        child: const Icon(Icons.arrow_back,
        size: 20,
        color: Colors.brown,
        ),
      ),
    );
  }


_getDateFromUser() async{

DateTime? _pickerDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015), lastDate: DateTime(2123));
if(_pickerDate!=null){
setState(() {
_selectedDate = _pickerDate;
print(_selectedDate);
  
});
}else{
  print("It is null or something is wrong");
}
}
}