import 'dart:convert';
import 'dart:math';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void httpErroHandle({
  required BuildContext context,
  required http.Response response,
  required Function onSuccess,
  Function(String)? showError,
}) {
  log(response.statusCode);
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:   
      showCustomSnackBar(
       
        context: context,
        text: jsonDecode(response.body)["error"],
       
    
       
      );
      break;
    case 500:
      showCustomSnackBar(
        context: context,
        text: jsonDecode(response.body)['errorCode']['message'],
      );
      break;
    default:
      showCustomSnackBar(context: context, text: response.body);
  }
}
