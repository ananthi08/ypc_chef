import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? widget;

  final TextEditingController? controller;
  const MyInputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            // color: Colors.grey,
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 10, 9, 9), width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child:
             Row(children: [
              Expanded(
                  child: TextFormField(
                readOnly: widget == null ? false : true,
                autofocus: false,
                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                controller: controller,
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: hint,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.backgroundColor, width: 0)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.colorScheme.background,
                          width: 0)),
                ),
              ),
              ),
              widget==null?Container():Container(child: widget)
            ]),
          )
        ],
      ),
    );
  }
}
