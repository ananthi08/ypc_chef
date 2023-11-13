import 'dart:async';
import 'dart:convert';

import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:chef_frontend/model/auth_model.dart';
import 'package:chef_frontend/views/auth/signin/otpformobile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MobileNumberBloc {
  final _mobileNumberController = StreamController<String>();
  final _loadingController = StreamController<bool>();

  Stream<String> get mobileNumberStream => _mobileNumberController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;

  void dispose() {
    _mobileNumberController.close();
    _loadingController.close();
  }

  Future<void> sendOTP(String mobileNumber, BuildContext context) async {
  
    _loadingController.sink.add(true);

    try {
      String baseUrl = '$KbaseUrl/chef/send/otp';
      sendOtP sendingotp = sendOtP(
        mobileNumber: mobileNumber,
      );

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: Kheader,
        body: sendingotp.toJson(),
      );
   print('wqwqwqwqwqwqw$response');
      // ignore: use_build_context_synchronously
      httpErroHandle(
        context: context,
        response: response,
        onSuccess: ()async {
      
          _loadingController.sink.add(false);
          _mobileNumberController.sink.add(mobileNumber);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          var loginId = jsonDecode(response.body)['loginId'];
          await prefs.setString("loginId", "$loginId");
          //  var mobileNumber = jsonDecode(response.body)['loginId'];
          await prefs.setString("mobileNumber", "$mobileNumber");
print('hi fgmobnnumberrndzzz$mobileNumber');

          loginId = prefs.getString("loginId");
          print('hi frndzzz$loginId');
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyOtpForSignin(mobileNumber: mobileNumber),
            ),
          );
        },
      );
    } catch (e) {
      print("Error: $e");
      showCustomSnackBar(
        context: context,
        text: "An error occurred: $e",
      );

      // Hide loading indicator on error
      _loadingController.sink.add(false);
    }
  }
}

final mobileNumberBloc = MobileNumberBloc();
