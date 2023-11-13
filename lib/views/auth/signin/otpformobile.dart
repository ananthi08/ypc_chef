// import 'dart:convert';
import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:chef_frontend/model/auth_model.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpForSignin extends StatefulWidget {
  static String route = '/chef/verify/otppage';
  const VerifyOtpForSignin({super.key, required String mobileNumber});

  @override
  State<VerifyOtpForSignin> createState() => _VerifyOtpForSigninState();
}

class _VerifyOtpForSigninState extends State<VerifyOtpForSignin> {
  String? otp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void verifyOTP(String otp, String mobileNumber) async {
    try {
 SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginId = prefs.getString("loginId");
   print("vanakkafrndsssssss$loginId");
    String? mobileNumber = prefs.getString("mobileNumber");
print("csacszcxszc$mobileNumber");
      String baseUrl = '$KbaseUrl/chef/session/verify/$loginId/mobile';

      // Replace with your backend API endpoint
      VerifyOTP verifyotp = VerifyOTP(
        otp: otp,
        mobileNumber:mobileNumber
      );
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: Kheader,
        body: verifyotp.toJson(),
      );

      // print(response.body);
      // ignore: use_build_context_synchronously
      httpErroHandle(
        context: context,
        response: response,
        onSuccess: () async {



SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginId = prefs.getString("loginId");
print("login id$loginId");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboardview(),
            ),
          );
        },
      );
    } catch (e) {
      
      showCustomSnackBar(
        context: context,
        text: "An error occurred: $e",
      );
    }
  }

  void press() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? mobileNumber = prefs.getString("mobileNumber");
      verifyOTP(otp!, mobileNumber!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // const CustomSVGImage(
                    //   path: "assets/otp_svg.svg",
                    //   height: 230,
                    //   bordercolor: Colors.black,
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    // const Headtextdualcolor(
                    //     mainaxisalignment: MainAxisAlignment.center,
                    //     text1: "OTP",
                    //     text2: "Verification",
                    //     paddingHorizontal: 30),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Please enter the 6 digit verification code that we have sent it to your mobile number",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 35,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        otp = pin;
                      },
                      onChanged: (value) {
                        if (value.length == 6) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  const  SizedBox(height: 25),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: 47.56,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CustomColor.myRedColor,
                          onPrimary: Colors.white,
                        ),
                        onPressed: press,
                        child: const Text(
                          'Verify OTP',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
