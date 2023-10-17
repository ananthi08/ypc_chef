// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:flutter/material.dart';

void popuperror({
  required BuildContext context,
  // required String title,
  required String text,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Error",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

// .........................................................
void showCustomSnackBar({
  required BuildContext context,
  required String text,
}) {


  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 181, 0, 0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.white, size: 30),
              const SizedBox(width: 8.0), 
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
// .......................................................


// awesome_snackbar_content.........................

enum ContentType { success, warning, help, failure }

class AwesomeSnackbarContent extends StatelessWidget {
  final String text;

  final Color backgroundColor;
  final ContentType contentType;

  AwesomeSnackbarContent({
    required this.text,
    // required this.behaviour,
    required this.backgroundColor,
    required this.contentType, 
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
        
          const Icon(
            Icons.info, 
            color: Colors.white,
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   message,
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 16.0,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

void showAwesomeSnackBar({
  required BuildContext context,
  required String text,
 
  required Color backgroundColor,
  required ContentType contentType, 
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: AwesomeSnackbarContent(
        text: text,
       
        backgroundColor: backgroundColor,
        contentType: contentType, 
      ),
      duration: const Duration(seconds: 3), 
       behavior: SnackBarBehavior.floating,
    ),
  );
}



