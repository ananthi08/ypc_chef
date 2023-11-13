import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/common_widget/customimage.dart';
import 'package:chef_frontend/common_widget/dual_color_widget.dart';
import 'package:chef_frontend/views/auth/signinnn_bloc/loginwithmobilenumber/MobileNumberBloc.dart';
import 'package:flutter/material.dart';
class MobileNumber extends StatefulWidget {
  static String route = '/chef/send otp';

  const MobileNumber({Key? key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  press() {
    final mobileNumber = mobileController.text;
    mobileNumberBloc.sendOTP(mobileNumber, context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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
            child: Column(
              children: [
                const CustomSVGImage(
                  path: "assets/number_input.svg",
                  height: 280,
                  bordercolor: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Headtextdualcolor(
                    mainaxisalignment: MainAxisAlignment.center,
                    text1: "Sign",
                    text2: "In",
                    paddingHorizontal: 30),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          controller: mobileController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone_android),
                            hintText: "Enter Your Number",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 47.56,
                          width: mediaQuery.size.width / 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomColor.myRedColor,
                              onPrimary: Colors.white,                             
                            ),
                            onPressed: () {
                              press();
                            },
                            child: StreamBuilder<bool>(
                              stream: mobileNumberBloc.loadingStream,
                              initialData: false,
                              builder: (context, snapshot) {
                                final isLoading = snapshot.data ?? false;
                                return isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text('Verify',
                                        style: TextStyle(fontSize: 20),
                                      );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not registered yet!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AccountCreate(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.myRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
