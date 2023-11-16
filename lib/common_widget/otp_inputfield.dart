
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:chef_frontend/model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPField extends StatefulWidget {
  @override
  _OTPFieldState createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  String otp = '';

  String userToken = '';
  String token = '';
  String userIdParameter = '';

  void verifyOTP({
    required String token,
    required String otp,
    required String userIdParameter,
    required context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginId = prefs.getString("loginId");
    String? token = prefs.getString("token");
    String? mobileNumber = prefs.getString("mobileNumber");
    if (loginId != null) {
      try {
        String baseUrl = '$kbaseUrl/chef/session/verify/$loginId/mobile';

        VerifyOTPRequest verifyRequest = VerifyOTPRequest(
          // token: 'token',
          mobileNumber: mobileNumber,
          otp: otp,
          loginId: userIdParameter,
        );
        print(otp);
        print(token);
        print('hiii loginnnnnnnnnid$loginId');

        http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: verifyRequest.toJson(),
      );
        print('Response: ${response.body}');

        httpErroHandle(
          context: context,
          response: response,
          onSuccess: () {
          
          },
        );
      } catch (e) {
        showCustomSnackBar(
          context: context,
          text: "An error occurred: $e",
        );
       
        print(e);
      }
    } else {
      print("Chef ID not found in SharedPreferences");
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        keyboardType: TextInputType.number,
        animationType: AnimationType.slide,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderWidth: 2,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
        ),
        onChanged: (value) {
          setState(() {
            otp = value;
          });
        },
        onCompleted: (otp) {
        
          verifyOTP(
            token: token,
            otp: otp,
            userIdParameter: userIdParameter,
            context: context,
          );
        },
      ),
    );
  }
}
