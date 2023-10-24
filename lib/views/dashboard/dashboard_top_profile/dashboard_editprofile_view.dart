// import 'dart:io';

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/imageupload/image_upload.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path/path.dart' as path;


class Editprofile extends StatefulWidget {
  static String route = '/dashboard/edit/Profile';
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  String selectedCountryCode = 'IN';
  String fullPhone = '';
  String imagePath = '';
  // File? _imageFile;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool _isObscure = true;
  String errorText = '';

  String nameError = '';
  String emailError = '';
  String mobilenumberError = '';
  String PasswordError = '';

  File? selectedImage;

File? selectedImageName;

Uint8List? _image;

Future<void> selectImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    setState(() {
      selectedImage = File(pickedImage.path);
    });

   
    final selectedImageName = path.basename(selectedImage!.path);
    print('Selected Image Name: $selectedImageName');

    YourApiService apiService = YourApiService();

    final response = await apiService.uploadImage(selectedImageName); // Send the filename as a String

    print('Image Upload Response: $response');

  } else {
   
    final pickedImage2 = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage2 != null) {
      setState(() {
        selectedImage = File(pickedImage2.path);
      });

     
      final selectedImageName = path.basename(selectedImage!.path);
      print('Selected Camera Image Name: $selectedImageName');

      YourApiService apiService = YourApiService();

      final response = await apiService.uploadImage(selectedImageName); // Send the filename as a String

      print('Camera Image Upload Response: $response');
      
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profilepage(),
                ),
              );
            },
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.center,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       IconButton(
              //         icon: Icon(Icons.arrow_back),
              //         onPressed: () async {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => const Profilepage()),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      " Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(168, 28, 5, 1),
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedIMage != null
                        ? CircleAvatar(
                            radius: 100,
                            backgroundImage: FileImage(selectedIMage!),
                          )
                        : const CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                    IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                        selectImage();
                      },
                      icon: const Icon(Icons.add_circle),
                      iconSize: 25,
                      color:const Color.fromARGB(255, 198, 198, 198),
                    ),
                  ],
                ),
              ),

              // const SizedBox(
              //   height: 25,
              // ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
                        child: Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                ValidationforTextformField().validateUsername,
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Your Name",
                              hintStyle: TextStyle(
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
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 280, 0),
                        child: Text(
                          'Email Id',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                ValidationforTextformField().validateEmail,
                            controller: emailIdController,
                            decoration: InputDecoration(
                              hintText: "Your Mail",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              errorText:
                                  emailError.isNotEmpty ? emailError : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 21,
                        ),
                        child: IntlPhoneField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: mobilenumberController,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
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
                          onSubmitted: (phone) {
                            setState(() {
                              fullPhone = mobilenumberController.text;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                ValidationforTextformField().validatePassword,
                            controller: PasswordController,
                            obscureText: _isObscure,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(
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
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        errorText,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)), backgroundColor: const Color(0xFFA51C05),
                                  minimumSize:const Size(310, 45),
                                ),
                                onPressed: () {},
                                child: const Text('Save Changes '),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //  bottomNavigationBar:const MyButtomNavBar()
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // Uint8List? _image;
  File? selectedIMage;
  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      // selectImage();

    });
    Navigator.of(context).pop();
  }
}
