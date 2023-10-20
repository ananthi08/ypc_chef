// import 'dart:developer';
import 'package:chef_frontend/common_widget/otp_inputfield.dart';
import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/auth/signinnn%20bloc/loginwithmobilenumber/widget.dart';
import 'package:chef_frontend/views/auth/signup/signup_view.dart';
import 'package:chef_frontend/views/first_page_view.dart';
// import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
  static String route = '/chef/signin';
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController emailIdController = TextEditingController();
  // TextEditingController OTPController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());
  String otp = "";
  bool _isObscure = true;
  bool rememberMe = false;
  bool showOtpInput = false;
  
  SignupApi Signin = SignupApi();
  
  press() async {
    if (rememberMe) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('rememberedEmail', emailIdController.text);
      prefs.setString('rememberedPassword', passwordController.text);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('rememberedEmail');
      await prefs.remove('rememberedPassword');
    }

    Signin.signin(
      email: emailIdController.text,
      password: passwordController.text,
      context: context,
    );
  }

  // Save email and password to shared preferences
  void saveRememberMeData(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rememberedEmail', email);
    await prefs.setString('rememberedPassword', password);
  }

// for session token
  SignupApi getToken = SignupApi();

  String? token;
  @override
  void initState() {
    super.initState();
    // tokencheck();
    getuserTOKEN();
    getuserId();
    gettingmobilenumber();
    loadRememberMeData();
  }

  tokencheck() async {
    token = await getToken.getToken(context: context);
    print("Your session token is : $token");
  }

// .......end of session token..........

// /userToken.........

  String? TOKEN;

  getuserTOKEN() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    print("Your user token is : $token");
  }

// ........

  tokencheck2() async {
    await getuserTOKEN();

    if (token == null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MobileNumber()),
      );
    } else {
      setState(() {
        showOtpInput = true;
      });
      print("showOtpInput set to true");
    }
  }

// END OF USER TOKEN

// ..........geting userid
  String? userId;

  getuserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId");
    print("Your userId is : $userId");
  }
// ......

// ..........geting userid
  String? mobilenumber;

  gettingmobilenumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobilenumber = prefs.getString("mobilenumber");
    print("Your mobilenumber is : $mobilenumber");
  }

// ......

  // Load saved email and password from shared preferences
  void loadRememberMeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailIdController.text = prefs.getString('rememberedEmail') ?? '';
      passwordController.text = prefs.getString('rememberedPassword') ?? '';
      rememberMe = emailIdController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }

  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Firstpage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Form(
            key: _formKey1,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                         TextSpan(
                          text: 'Hello ',
                          style:  GoogleFonts.dmSans(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' there',
                          style:  GoogleFonts.dmSans(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Text(
                        'Enter your email & password ',
                        style:  GoogleFonts.dmSans(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                       Text(
                        'to sign in.',
                        style:  GoogleFonts.dmSans(
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 30),
                       Text(
                        'User Email',
                        style:  GoogleFonts.dmSans(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailIdController,
                        validator: ValidationforTextformField().validateEmail,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          hintStyle:  GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                        ),
                      ),
                      const SizedBox(height: 25),
                       Text(
                        'Password',
                        style:  GoogleFonts.dmSans(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        obscureText: _isObscure,
                        validator:
                            ValidationforTextformField().validatePassword,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
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
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (bool? newValue) {
                              setState(() {
                                rememberMe = newValue ?? false;
                              });
                            },
                          ),
                          const Text('Remember me'),
                          // SizedBox(width: MediaQuery.of(context).size.width * 5,),
                          const Spacer(),
                          Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Forgot()),
                                );
                              },
                              child:  Text(
                                'Forgot Password?',
                                style:  GoogleFonts.dmSans(
                                  color: const Color(0xFFA51C05),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        // child: Text("Continue With Mobile"),
                        child: Container(
                          alignment: Alignment.center,
                          // child: Text(

                          child:  Text(
                            'or',
                            style:  GoogleFonts.dmSans(
                              color: const Color(0xFFA51C05),
                              fontSize: 12,
                            ),
                          ),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: <Widget>[
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            // child: Text("Continue With Mobile"),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  tokencheck2();
                                },
                                child:  Text(
                                  'Continue With Mobile Number',
                                  style:  GoogleFonts.dmSans(
                                    color: const Color(0xFFA51C05),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      )
                    ],
                  ),
                ),
                //  SizedBox(height:1),
                Visibility(
                  visible: showOtpInput && token != null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: OTPField(),
                    ),
                  ),
                ),
                Visibility(
                  visible: showOtpInput,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child:  Text(
                        'Resend OTP',
                        style:  GoogleFonts.dmSans(
                          color: const Color(0xFFA51C05),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 47.56,
                    width: 700,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFA51C05),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          press();
                        }
                        //  else
                        //   () {};
                      },
                      child:  Text(
                        'Sign in',
                        style:  GoogleFonts.dmSans(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height:10),
                Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                         TextSpan(
                          text: 'Don’t have an account? ',
                          style:  GoogleFonts.dmSans(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style:  GoogleFonts.dmSans(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AccountCreate()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
