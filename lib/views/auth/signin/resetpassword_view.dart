import 'dart:developer';

import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset extends StatefulWidget {
  static String route = '/user/ResetPassword';
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  int currentStep = 1;

    TextEditingController newpasswordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();



  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isobscure = true;
  String errorText = '';

  SignupApi Reset = SignupApi();
  press() async {
    Reset.reset(
        newpassword: newpasswordcontroller.text,
        context: context);
  }

  @override
  void dispose() {
    super.dispose();
    newpasswordcontroller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 252, 1),
      body: Builder(
        builder: (BuildContext context) {
          final mediaQuery = MediaQuery.of(context);
          final size = MediaQuery.of(context).size;
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Form(
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
                  
                     Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Reset',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' Password',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.myRedColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                      
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                              Center(
                                child: SvgPicture.asset(
                                    "assets/Resetpassword.svg",                             
                                  ),
                              ),
                           

                           
                            Padding(
                              padding: const EdgeInsets.only(left: 10,bottom: 10),
                              child: Container(
                                child: Text(
                                  'New Password',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: ValidationforTextformField()
                                    .validatePassword,
                                controller: newpasswordcontroller,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Password",
                                  hintStyle:  GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    child: Icon(
                                      _isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,bottom: 10),
                              child: Text(
                                'Confirm Password',
                                style: GoogleFonts.dmSans(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 50),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // controller: confirmPasswordcontroller,
                                obscureText: _isobscure,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle:  GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isobscure = !_isobscure;
                                      });
                                    },
                                    child: Icon(
                                      _isobscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  return ValidationforTextformField()
                                      .validateConfirmPassword(
                                          value, newpasswordcontroller.text);
                                },
                              ),
                            ),
                            Text(
                              errorText,
                              style:   GoogleFonts.dmSans(
                                color: Colors.red,
                              ),
                            ),
                 



                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 47.56,
                                width: mediaQuery.size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: CustomColor.myRedColor,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (_formKey1.currentState!.validate()) {
                                  
                                      press();
                                    }
                                  },
                                  child:  Text(
                                    'Reset Password',
                                    style:  GoogleFonts.dmSans(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )

                    //              ],
                    //  ))

                    // ],
                    // )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}