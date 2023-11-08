import 'package:chef_frontend/common_widget/custom%20GREEN/customgreen.dart';
import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/auth_service/authentication_view.dart';
import 'package:flutter/material.dart';

class Forgot extends StatelessWidget {
  static String route = '/chef/forgotpassword';

  const Forgot({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();

    // Function to handle button press
    // api calling
    SignupApi Forget = SignupApi();
   verifyEmail() {
      
        Forget.forget(
          email: emailController.text,
          context: context,
        );
      
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 270, 30, 10),
                    child: Text(
                      "Forgot your Password ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.myRedColor,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Text(
                    "Enter the Email address associated with \n your account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextFormField(
                    showCursor: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: ValidationforTextformField().validateEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: CustomColor.myRedColor,
                    minimumSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                          verifyEmail();
                        }
                  },
                  child: const Text('Verify Email'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
