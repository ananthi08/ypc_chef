// import 'dart:convert';
// ignore_for_file: unused_import

import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/common_widget/customimage.dart';
import 'package:chef_frontend/common_widget/dual_color_widget.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:chef_frontend/model/auth_model.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpForSignin extends StatefulWidget {
  static String route = '/user/verify/otppage';
  const VerifyOtpForSignin({super.key, required String mobileNumber});

  @override
  State<VerifyOtpForSignin> createState() => _VerifyOtpForSigninState();
}

class _VerifyOtpForSigninState extends State<VerifyOtpForSignin> {
  String? otp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


 TextEditingController pinController = TextEditingController();
 
  final focusNode = FocusNode();

   
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:const Color.fromRGBO(157, 118, 193, 1)),
       
      ),
    );



//   void verifyOTP(String otp, String mobileNumber) async {
//     try {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? loginId = prefs.getString("loginId");
//    print("vanakkafrndsssssss$loginId");
//     String? mobileNumber = prefs.getString("mobileNumber");
// print("csacszcxszc$mobileNumber");
//       String baseUrl = '$KbaseUrl/user/session/verify/$loginId/mobile';

//       // Replace with your backend API endpoint
//       VerifyOTP verifyotp = VerifyOTP(
//         otp: otp,
//         mobileNumber:mobileNumber
//       );
//       final response = await http.post(
//         Uri.parse(baseUrl),
//         headers: Kheader,
//         body: verifyotp.toJson(),
//       );

//       // print(response.body);
//       // ignore: use_build_context_synchronously
//       httpErroHandle(
//         context: context,
//         response: response,
//         onSuccess: () async {



// SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? loginId = prefs.getString("loginId");
// print("loginnnnnnnnnnnnn id$loginId");

//           // ignore: use_build_context_synchronously
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const Chefflow(selectedCuisineIds: [],),
//             ),
//           );
//         },
//       );
//     } catch (e) {
      
//       // ignore: use_build_context_synchronously
//       showCustomSnackBar(
//         context: context,
//         text: "An error occurred: $e",
//       );
//     }
//   }
  SignupApi Signin = SignupApi();

  void press() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? mobileNumber = prefs.getString("mobileNumber");
      // verifyOTP(otp!, mobileNumber!);
    }

    Signin.verifyyOTP(
      otp: pinController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                    const CustomSVGImage(
                      path: "assets/otp_svg.svg",
                      height: 230,
                      bordercolor: Colors.black,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Headtextdualcolor(
                        mainaxisalignment: MainAxisAlignment.center,
                        text1: "OTP",
                        text2: "Verification",
                        paddingHorizontal: 30),
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
                    Directionality(
                              textDirection: TextDirection.ltr,

                      child: Pinput(
                        length: 6,
                        // width: MediaQuery.of(context).size.width,
                        // fieldWidth: 35,
                        // style: const TextStyle(
                        //   fontSize: 17,
                        // ),
                        // textFieldAlignment: MainAxisAlignment.spaceAround,
                        // fieldStyle: FieldStyle.box,
                        // onCompleted: (pin) {
                        //   otp = pin;
                        // },
                        // onChanged: (value) {
                        //   if (value.length == 6) {
                        //     FocusScope.of(context).nextFocus();
                        //   }
                        // },
                         controller: pinController,
                        
                         focusNode: focusNode,
                         androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme: defaultPinTheme,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 8),
                                validator: (value) {
                                  return value == null || value.isEmpty
                                      ? "Please enter OTP"
                                      : null;
                                     
                                },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                                  onCompleted: (otp) {
                                    debugPrint('onCompleted: $otp');
                               
                                  },
                                  onChanged: (value) {
                                    debugPrint('onChanged: $value');
                                  },
                      ),
                    
                    ),
                  const  SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 47.56,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFA51C05),
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

