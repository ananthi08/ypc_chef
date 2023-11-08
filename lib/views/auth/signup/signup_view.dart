
import 'package:chef_frontend/common_widget/custom%20GREEN/customgreen.dart';
import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class AccountCreate extends StatefulWidget {
  static String route = '/chef/account';
  const AccountCreate({super.key});

  @override
  State<AccountCreate> createState() => _AccountCreateState();
}

class _AccountCreateState extends State<AccountCreate> {
  int currentStep = 1;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // String selectedCountryCode = 'IN';
  String fullPhone = '';

  String selectedCountryCode = '';
  String inputMobileNumber = '';

  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  bool rememberMe = false;
  bool _isObscure = true;
  bool _isobscure = true;

// ....for input validation
  String errorText = '';

  String nameError = '';
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

// creating instance for using the class in service file
//mobile numer variable

  String? mobileCode;
  String? mobileNumber;
  SignupApi register = SignupApi();
  press() async {
    register.signup(
        name: nameController.text,
        email: emailIdController.text,
        password: passwordController.text,
        confirmpassword: confirmPasswordController.text,
        mobilenumber: "+$mobileCode $mobileNumber",
        context: context);

    print("+$mobileCode $mobileNumber");
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailIdController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? token;

  void getuserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    print("Your user token is : $token");
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
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 50.0,
                            width: 280.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: StepProgressIndicator(
                                roundedEdges: const Radius.circular(20),
                                totalSteps: 5,
                                currentStep: currentStep,
                                size: 8,
                                padding: 0,
                                selectedColor: CustomColor.myRedColor,
                                unselectedColor: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                               TextSpan(
                                text: 'Create an',
                                style: GoogleFonts.dmSans(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' Account',
                                style: GoogleFonts.dmSans(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color:CustomColor.myRedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Enter your email & password .',
                          style:  GoogleFonts.dmSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Column(
                    //   children: [
                    Image.asset(
                      'assets/chef_logo.png',
                      width: 100,
                      height: 100,
                    ),

                    //              Expanded(child:
                    //  ListView(
                    //   shrinkWrap: true,
                    //   children: [
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


                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: Text(
                                  'User Name',
                                  style:  GoogleFonts.dmSans(
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
                                    .validateUsername,
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Your Name",
                                  hintStyle:  GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  errorText:
                                      nameError.isNotEmpty ? nameError : null,
                                ),
                              ),
                            ),

                           const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: Text(
                                  'Email Id',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),

                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator:
                                    ValidationforTextformField().validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailIdController,
                                decoration: InputDecoration(
                                  hintText: "Your Mail",
                                  hintStyle:  GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  // errorText: emailError.isNotEmpty ? emailError : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Mobile Number', // Your label or hint text
                                style:  GoogleFonts.dmSans(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: IntlPhoneField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    
                                controller: mobileNumberController,
                                decoration: InputDecoration(
                                  hintText: 'Mobile Number',
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
                                initialCountryCode: 'IN',
                                onCountryChanged: (phone) {
                                  
                                  mobileCode = phone.dialCode;
                                },
                                onChanged: (phone) {
                                 
                                  mobileNumber = phone.number;
                                  // setState(() {

                                  //   fullPhone = mobileNumberController.text;
                                  // });
                                },
                              ),
                            ),
                           Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: Text(
                                  'Password',
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
                                controller: passwordController,
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
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                child: Text(
                                  'Confirm Password',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 50),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: confirmPasswordController,
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
                                          value, passwordController.text);
                                },
                              ),
                            ),
                            Text(
                              errorText,
                              style:   GoogleFonts.dmSans(
                                color: Colors.red,
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: rememberMe,
                            //       onChanged: (bool? newValue) {
                            //         setState(() {
                            //           rememberMe = newValue ?? false;
                            //         });
                            //       },
                            //     ),
                            //     Text('Remember me'),
                            //   ],
                            // ),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                height: 47.56,
                                width: mediaQuery.size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:CustomColor.myRedColor,
                                    onPrimary: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (_formKey1.currentState!.validate()) {
                                  
                                      press();
                                    }
                                  },
                                  child:  Text(
                                    'Signup',
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
