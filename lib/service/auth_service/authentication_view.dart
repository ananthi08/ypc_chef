// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/constants/utilities.dart';
import 'package:chef_frontend/views/auth/signin/otpformobile.dart';
import 'package:chef_frontend/views/auth/signin/resetpassword_view.dart';
import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/auth_model.dart';


class SignupApi {
  ////////////////////for registration////////////////////
  ///
  signup({
    required String email,
    required String name,
    required String password,
    required String confirmpassword,
    required String mobilenumber,
    required String mobileCode,

    required context,
  }) async {
    try {
      String baseUrl = '$kbaseUrl/chef/register';
    var test = mobileCode.isEmpty ? '91': mobileCode; 

      // Replace with your backend API endpoint
      Signup signupbody = Signup(
        email: email,
        password: password,
        userName: name,
        // mobileNumber: mobilenumber,
        mobileNumber: "+$test $mobilenumber",

      );
      // print("$mobilenumber");
  
     
      
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: signupbody.toJson(),
        // body:encryptedData,
      );
// print('encrypteddata $encryptedData');
      httpErroHandle(
        context: context,
        response: response,
        onSuccess: () async {
// USER TOKEN START
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var token = jsonDecode(response.body)['token'];
          await prefs.setString("token", "$token");

          token = prefs.getString("token");

          // print("heloo frnd $token");
// USER TOKEN  END

          //  .....chefId...........start
          var chefId = jsonDecode(response.body)['chefId'];
          await prefs.setString("chefId", "$chefId");

          chefId = prefs.getString("chefId");

          print("heloo frnd $chefId");
// ................userId   end

 // Save mobilenumber in local storage
        await prefs.setString("mobilenumber", mobilenumber);
         print("heloo mobilenumber $mobilenumber");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  const Dashboardview(),
            ),
          );
        },
      );
    } catch (e) {
      print("eeeeeeeeeeeeee$e");
      showCustomSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }

///////////////////////////////for login/////////////////////////

  void signin({
    required String email,
    required String password,
    // required String OTP,
    required context,
  }) async {
    try {
      String baseUrl = '$kbaseUrl/chef/login';

    
      Signinn signinbody = Signinn(
        email: email,
        password: password,
      );

    //    final encryptionData = EncryptionData.instance; 

    // final dataToEncrypt = signinbody.toMap();

    // Encrypt the data
    // final encryptedData = encryptionData.encrypt(jsonEncode(dataToEncrypt));

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: signinbody.toJson(),
        // body: encryptedData,

      );
      // print('encrypteddata $encryptedData');
      // final decryptionData = EncryptionData.instance;
      // final datatodecrypt =  encryptionData.decrypt(encryptedData);
      // print('decryptionnnnnnnnnnnnnn$datatodecrypt');
      // print(response.body);
      httpErroHandle(
        context: context,
        response: response,
        onSuccess: () async {
          print("djwdwewd");
          //  .....userId...........start
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var chefId = jsonDecode(response.body)['chefId'];
          await prefs.setString("chefId", "$chefId");
          print('cheffffffffffcdcdffffffid$chefId');

          chefId = prefs.getString("chefId");
        // ................userId   end
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>const Dashboardview(),
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
    }
  }

// get apifor getting session token..........................

  Future<String?> getToken({
    required context,
  }) async {
    try {
      String baseUrl = '$ksessionUrl/Session/Token';

      final sessionTokenResponse = await http.get(
        Uri.parse(baseUrl),
        headers: kHeader,
      );
      String? sessionToken;
      httpErroHandle(
        context: context,
        response: sessionTokenResponse,
        onSuccess: () {
          sessionToken = jsonDecode(sessionTokenResponse.body)['sessionToken'];
          print(
              "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::$sessionToken");

          // return sessionToken;
        },
      );

      return sessionToken;
    } catch (e) {
      showCustomSnackBar(
        context: context,
        text: "An error occurred: $e",
      );
    }
    return null;
  }
  // ..............end of getting session token

//  RESET password api

  reset({
    required String newpassword,
    required context,
  }) async {
    try {
      log("comming  hehre erererere");

      String baseUrl = '$kbaseUrl/chef/reset/password';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString("email");
      print("Email retrieved from SharedPreferences: $email");

      // Replace with your backend API endpoint
      Resetpassword reset = Resetpassword(
        newpassword: newpassword,
        email: email,
      );
      print("$newpassword");
      print("$email");
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: reset.toJson(),
      );
      httpErroHandle(
        context: context,
        response: response,
        onSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboardview(),
            ),
          );
        },
      );
      print(response.body);
    } catch (e) {
      showCustomSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }
  // /........................

  // ..................forget password

  forget({
    required String email,
    required context,
  }) async {
    try {
      String baseUrl = '$kbaseUrl/chef/verify/email';

      // Replace with your backend API endpoint
      Verifyemail verify = Verifyemail(
        email: email,
      );

      print("$email");
      http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: verify.toJson(),
      );
      log("${response.statusCode}");

     
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString("email", email);
        print(prefs.getString("email"));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Reset()),
        );
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        popuperror(
          context: context,
          text: jsonDecode(response.body)["error"],
        );
      }

      log("comming   erererere");
    } catch (e) {
      showCustomSnackBar(
        context: context,
        text: e.toString(),
      );
    }
  }

// SEND OTP WITH MOBILE NUMBER
void sendotpwith_mobilenumber({
  required String mobileNumber,
  required context,
}) async {
  try {
    String baseUrl = '$kbaseUrl/chef/send/otp';

    sendOtP sendingotp = sendOtP(
      mobileNumber: mobileNumber,
    );
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: kHeader,
      body: sendingotp.toJson(),
    );
    print(response.body);
    httpErroHandle(
      context: context,
      response: response,
      onSuccess: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString("mobileNumber", mobileNumber);
       

          var loginId = jsonDecode(response.body)['loginId'];
          await prefs.setString("loginId", "$loginId");

          loginId = prefs.getString("loginId");



        print("loooooooooooooooogin id$loginId");

        Navigator.push(
          context,  
          MaterialPageRoute(
            builder: (context) => const VerifyOtpForSignin(mobileNumber: 'mobileNumber',),
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
  }
}

// ..............................


// .......... // verify mob num otp
  String? otp = '';

  // String userToken = '';
  // String token = '';
  // String userIdParameter = '';

  void verifyyOTP({
    // required String token,
    required String? otp,
    // required String userIdParameter,
    required context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString("userId");
    String? loginId = prefs.getString("loginId");

    // String? token = prefs.getString("token");
    String? mobileNumber = prefs.getString("mobileNumber");

    if (loginId != null) {
      try {
        String baseUrl = '$kbaseUrl/chef/session/verify/$loginId/mobile';

        VerifyOTP verifyRequest = VerifyOTP(
          // token: 'token',
          mobileNumber: mobileNumber,
          otp: otp,
          // userId: userIdParameter,
        );
        print(otp);
       
        print('vdxvcxvxvxvxvxvsvssadsds$loginId');

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
          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboardview(),
                          ),
                        );
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
      print("User ID not found in SharedPreferences");
     
    }
  }


// verify otp using usertoken

String otpp = '';

  String userToken = '';
  String token = '';
  // String userIdParameter = '';

  void verifyuserTokenOTP({
    required String token,
    required String otpp,
    required String userIdParameter,
    required context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginId = prefs.getString("loginId");
    // String? token = prefs.getString("token");
    String? mobileNumber = prefs.getString("mobileNumber");

    if (loginId != null) {
      try {
        String baseUrl = '$kbaseUrl/chef/session/verify/$loginId/mobile';

        VerifyOTPRequest verifyRequest = VerifyOTPRequest(
          // token: 'token',
          mobileNumber: mobileNumber,
          otp: otpp,
          loginId: userIdParameter,
        );
        print(otp);
       
        print('okokokoakokokaokoakoka$loginId');

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
          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboardview(),
                          ),
                        );
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
      print("User ID not found in SharedPreferences");
     
    }
  }



 void deleteAccount({
    required context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("userId");
      String baseUrl = '$kbaseUrl/chef/profile/delete/$userId';

      final response = await http.put(
        Uri.parse(baseUrl),
        headers: kHeader,
      );

      httpErroHandle(
        context: context,
        response: response,
        onSuccess: () async {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()),
                        );
        },
      );
    } catch (e) {
      showCustomSnackBar(
        context: context,
        text: "$e",
      );
    }
  }
}
