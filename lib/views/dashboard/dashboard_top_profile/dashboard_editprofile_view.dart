// import 'dart:io';

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/constants/validation.dart';
import 'package:chef_frontend/service/GET_services/getting_chefDetails.dart';
import 'package:chef_frontend/service/imageupload/image_upload.dart';
import 'package:chef_frontend/service/imageupload/profile/editprofile.dart';
import 'package:chef_frontend/service/post_api/image_upload_provider.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';


// class Editprofile extends StatefulWidget {
//   static String route = '/dashboard/edit/Profile';
//   const Editprofile({super.key});

//   @override
//   State<Editprofile> createState() => _EditprofileState();
// }

// class _EditprofileState extends State<Editprofile> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailIdController = TextEditingController();
//   TextEditingController mobilenumberController = TextEditingController();
//   TextEditingController PasswordController = TextEditingController();

//   String selectedCountryCode = 'IN';
//   String fullPhone = '';
//   String imagePath = '';
//   // File? _imageFile;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   bool rememberMe = false;
//   bool _isObscure = true;
//   String errorText = '';

//   String nameError = '';
//   String emailError = '';
//   String mobilenumberError = '';
//   String PasswordError = '';




//   File? selectedImageName;

//   Uint8List? _image;

//   File? selectedImage;
//   String? propicurl;
//   Future<void> selectImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       setState(() {
//         selectedImage = File(pickedImage.path);
//       });

//       YourApiService apiService = YourApiService();
//       final response = await apiService.uploadImage(selectedImage);
//       ImageUploadProvider imageUploadProvider =
//           context.read<ImageUploadProvider>();
//       imageUploadProvider.setPropicUrl(response);
//     } else {
//       final pickedImage2 = await picker.pickImage(source: ImageSource.camera);
//       if (pickedImage2 != null) {
//         setState(() {
//           selectedImage = File(pickedImage2.path);
//         });

//         YourApiService apiService = YourApiService();
//         final response = await apiService.uploadImage(selectedImage);

//         ImageUploadProvider imageUploadProvider =
//             context.read<ImageUploadProvider>();
//         imageUploadProvider.setPropicUrl(response);
//       }
//     }
//   }


//   late String userId = '';
//   late String userName = '';
//   late String email = '';
//   final GETchefDetails _chefDetails = GETchefDetails();

//  @override
//   void initState() {
//     super.initState();
//     getUserId();
//   }

//    String imageUrl = '';
//   Future<void> getUserId() async {
//     try {
//       final chefDetails = await _chefDetails
//           .getchefDetails(context: context, selectedCuisineIds: []);
//       if (chefDetails != null) {
//         setState(() {
//           userId = chefDetails['id'] ?? '';
//           userName = chefDetails['userName'] ?? '';
//           email = chefDetails['email'] ?? '';
//           imageUrl = chefDetails['imageUrl'] ?? '';

//         });
//       // print(chefDetails);
//           // log(email);

//       }
//     } catch (e) {
//       print("Error fetching user details: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//           leading: IconButton(
//             color: Colors.black,
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () async {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Profilepage(),
//                 ),
//               );
//             },
//           ),
//         ),

//         body: SingleChildScrollView(
//           child: Column(
//             children: [
   

//               const SizedBox(
//                 height: 25,
//               ),
//               const Padding(
//                 padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//                 child: Column(
//                   children: [
//                     Text(
//                       " Edit Profile",
//                       style: GoogleFonts.dmSans(
//                           fontWeight: FontWeight.bold,
//                           color: CustomColor.myRedColor,
//                           fontSize: 18),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

//               Padding(
//                 padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     selectedIMage != null
//                         ? CircleAvatar(
//                             radius: 100,
//                             backgroundImage: FileImage(selectedIMage!),
//                           )
//                         : const CircleAvatar(
//                             radius: 60,
//                             backgroundImage: NetworkImage(
//                                 "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
//                           ),
//                     IconButton(
//                       onPressed: () {
//                         showImagePickerOption(context);
//                         selectImage();
//                       },
//                       icon: const Icon(Icons.add_circle),
//                       iconSize: 25,
//                       color:const Color.fromARGB(255, 198, 198, 198),
//                     ),
//                   ],
//                 ),
//               ),

//               // const SizedBox(
//               //   height: 25,
//               // ),
//               SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
//                         child: Text(
//                           'User Name',
//                           style: GoogleFonts.dmSans(
//                             fontSize: 15,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         height: 60,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                           child: TextFormField(
//                             autovalidateMode:
//                                 AutovalidateMode.onUserInteraction,
//                             validator:
//                                 ValidationforTextformField().validateUsername,
//                             controller: nameController,
//                             decoration: InputDecoration(
//                               hintText: "Your Name",
//                               hintStyle: GoogleFonts.dmSans(
//                                 fontSize: 15,
//                                 color: Colors.grey.shade400,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey.shade200,
//                               errorText:
//                                   nameError.isNotEmpty ? nameError : null,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 280, 0),
//                         child: Text(
//                           'Email Id',
//                           style: GoogleFonts.dmSans(
//                             fontSize: 15,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: Container(
//                           height: 50,
//                           child: TextFormField(
//                             autovalidateMode:
//                                 AutovalidateMode.onUserInteraction,
//                             validator:
//                                 ValidationforTextformField().validateEmail,
//                             controller: emailIdController,
//                             decoration: InputDecoration(
//                               hintText: "Your Mail",
//                               hintStyle: GoogleFonts.dmSans(
//                                 fontSize: 15,
//                                 color: Colors.grey.shade400,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey.shade200,
//                               errorText:
//                                   emailError.isNotEmpty ? emailError : null,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 230, 0),
//                         child: Text(
//                           'Mobile Number',
//                           style: GoogleFonts.dmSans(
//                             fontSize: 15,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 21,
//                         ),
//                         child: IntlPhoneField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           controller: mobilenumberController,
//                           decoration: InputDecoration(
//                             hintText: 'Mobile Number',
//                             hintStyle: GoogleFonts.dmSans(
//                               fontSize: 15,
//                               color: Colors.grey.shade400,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             filled: true,
//                             fillColor: Colors.grey.shade200,
//                           ),
//                           initialCountryCode: 'IN',
//                           onSubmitted: (phone) {
//                             setState(() {
//                               fullPhone = mobilenumberController.text;
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
//                         child: Text(
//                           'Password',
//                           style: GoogleFonts.dmSans(
//                             fontSize: 15,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                       // const SizedBox(
//                       //   height: 10,
//                       // ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: Container(
//                           height: 50,
//                           child: TextFormField(
//                             autovalidateMode:
//                                 AutovalidateMode.onUserInteraction,
//                             validator:
//                                 ValidationforTextformField().validatePassword,
//                             controller: PasswordController,
//                             obscureText: _isObscure,
//                             keyboardType: TextInputType.visiblePassword,
//                             decoration: InputDecoration(
//                               hintText: "Enter Your Password",
//                               hintStyle: GoogleFonts.dmSans(
//                                 fontSize: 15,
//                                 color: Colors.grey.shade400,
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey.shade200,
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     _isObscure = !_isObscure;
//                                   });
//                                 },
//                                 child: Icon(
//                                   _isObscure
//                                       ? Icons.visibility
//                                       : Icons.visibility_off,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         errorText,
//                         style: const GoogleFonts.dmSans(
//                           color: Colors.red,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Column(
//                         children: [
//                           Center(
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10)), backgroundColor:CustomColor.myRedColor,
//                                   minimumSize:const Size(310, 45),
//                                 ),
//                                 onPressed: () {},
//                                 child: const Text('Save Changes '),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//        bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         color:const Color.fromARGB(255, 240, 240, 240),


//       child: Container(

//         height: 50,

//         child: Row(
          
//           mainAxisAlignment:MainAxisAlignment.spaceAround,
//           children: 
//         [
// // for home
//           IconButton(onPressed: (){
//             Navigator.pushNamed(context, Dashboardview.route);
//           },
//           icon: Icon(Icons.home_filled,color: Color.fromARGB(255, 173, 20, 0),)
//           ),

// // for cart
//             IconButton(onPressed: (){
            
//           }, 
          
//           icon: Icon(Icons.shopping_cart_checkout,color: Color.fromARGB(255, 173, 20, 0),)
//           ),
// // for mail
//           IconButton(onPressed: (){
            
//           }, 
          
//           icon: Icon(Icons.notifications_active,color:Color.fromARGB(255, 173, 20, 0),)
//           ),

//               IconButton(onPressed: (){
            
//           }, 
          
//           icon: Icon(Icons.mail,color: Color.fromARGB(255, 173, 20, 0),)
//           ),

//         ],
//         ),

//       ),
        
//        ),
//       ),
//     );
//   }

//   void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: Colors.blue[100],
//         context: context,
//         builder: (builder) {
//           return Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 4.5,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         _pickImageFromGallery();
//                       },
//                       child: const SizedBox(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.image,
//                               size: 70,
//                             ),
//                             Text("Gallery")
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         _pickImageFromCamera();
//                       },
//                       child: const SizedBox(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.camera_alt,
//                               size: 70,
//                             ),
//                             Text("Camera")
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   // Uint8List? _image;
//   File? selectedIMage;
//   //Gallery
//   Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       selectedIMage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop();
//   }

// //Camera
//   Future _pickImageFromCamera() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;
//     setState(() {
//       selectedIMage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//       // selectImage();

//     });
//     Navigator.of(context).pop();
//   }
// }




class Editprofile extends StatefulWidget {
  static String route = '/dashboard/edit/Profile';
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  late String userId = '';
  late String userName = '';
  late String email = '';
  // late String whatsAppNumber = '';
  late String gender = '';
  late String facebookLink = '';
  late String instagramLink = '';
  late String whatsAppNumber = '';

  String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  TextEditingController facebookController = TextEditingController();
  TextEditingController iNstagramController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String enterwhatsappNumber = "";
  String selectedGender = "";
  String userNameField = "";
  String enterfacebookLink1 = "";

  String enterinstagramLink = "";

  bool? singleSelected;
  String selectedMaritalStatus = "";

  String selectedCountryCode = 'IN';
  String fullPhone = '';
  String imagePath = '';
  // File? _imageFile;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  // bool _isObscure = true;
  // bool _isobscure = true;
  String errorText = '';

  String nameError = '';
  String emailError = '';
  String mobilenumberError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  String mobileCode = '';
  String mobileNumber = '';

  EditProfile Editprofile = EditProfile();
  press() async {
    Editprofile.editprofile(
        name1: nameController.text,
        gender1: selectedGender,
        instagramLink1: iNstagramController.text,
        facebookLink1: facebookController.text,
        whatsAppNumber1: whatsappNumberController.text,
        email1: emailIdController.text,
        context: context);

    //   print("+$mobileCode $mobileNumber");
  }

  int childrenQuantity = 0;
  int adultsQuantity = 0;

  File? selectedImageName;

  Uint8List? _image;

  File? selectedImage;
  String? propicurl;
  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });

      YourApiService apiService = YourApiService();
      final response = await apiService.uploadImage(selectedImage);
      ImageUploadProvider imageUploadProvider =
          context.read<ImageUploadProvider>();
      imageUploadProvider.setPropicUrl(response);
    } else {
      final pickedImage2 = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage2 != null) {
        setState(() {
          selectedImage = File(pickedImage2.path);
        });

        YourApiService apiService = YourApiService();
        final response = await apiService.uploadImage(selectedImage);

        ImageUploadProvider imageUploadProvider =
            context.read<ImageUploadProvider>();
        imageUploadProvider.setPropicUrl(response);
      }
    }
  }


  final GETchefDetails _chefDetails = GETchefDetails();

 @override
  void initState() {
    super.initState();
    getUserId();
    
  }

   String imageUrl = '';
  Future<void> getUserId() async {
    try {
      final chefDetails = await _chefDetails
          .getchefDetails(context: context, selectedCuisineIds: []);
      if (chefDetails != null) {
        setState(() {
          // userId = chefDetails['id'] ?? '';
          // userName = chefDetails['userName'] ?? '';
          // email = chefDetails['email'] ?? '';
          // imageUrl = chefDetails['imageUrl'] ?? '';



            userId = chefDetails['id'] ?? '';

          userName = chefDetails['userName'] ?? '';
          nameController.text = userName;

          email = chefDetails['email'] ?? '';
          emailIdController.text = email;

          facebookLink = chefDetails['facebookLink'] ?? '';

          facebookController.text = facebookLink;

          instagramLink = chefDetails['instagramLink'] ?? '';
          iNstagramController.text = instagramLink;

          imageUrl = chefDetails['imageUrl'] ?? '';

          print('imageUrl    propic    imageUrlimageUrl$imageUrl');

          whatsAppNumber = chefDetails['whatsAppNumber'] ?? '';
          whatsappNumberController.text = whatsAppNumber;

          gender = chefDetails['gender'] ?? '';
          genderController.text = gender;

        });
      // print(chefDetails);
          // log(email);

      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
               Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      " Edit Profile",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3E4D52),
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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
               
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: (selectedImage != null)
                          ? FileImage(selectedImage!)
                          : (imageUrl.isNotEmpty
                              ? NetworkImage('$node$imageUrl')
                              : (propicurl != null && propicurl!.isNotEmpty
                                  ? NetworkImage(propicurl!)
                                      as ImageProvider<Object>
                                  : const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"))),
                    ),

                    IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                        selectImage();
                      },
                      icon: const Icon(Icons.add_circle),
                      iconSize: 25,
                      color: const Color.fromARGB(255, 198, 198, 198),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'User Name',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            // textCapitalization:TextCapitalization.,
                            // initialValue: userName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                ValidationforTextformField().validateUsername,
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "username",
                              hintStyle: GoogleFonts.dmSans(
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
                      // const SizedBox(height: 20),
                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Email Id',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: SizedBox(
                          height: 80,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator:
                                ValidationforTextformField().validateEmail,
                            controller: emailIdController,
                            decoration: InputDecoration(
                              hintText: email,
                              hintStyle: GoogleFonts.dmSans(
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
                            // onChanged: (value) {
                            //   setState(() {
                            //     emailIdController.text=value;
                            //   });
                            // },
                          ),
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Whatsapp Number',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: IntlPhoneField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: whatsappNumberController,
                          decoration: InputDecoration(
                            hintText: 'phone Number',
                            hintStyle: GoogleFonts.dmSans(
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
                            var mobileCode = phone.dialCode;
                          },
                       
                        ),
                      ),

                      Text(
                        errorText,
                        style:  GoogleFonts.dmSans(
                          color: Colors.red,
                        ),
                      ),

                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Gender',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Select',
                            hintStyle:  GoogleFonts.dmSans(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "Male",
                              child: Text("Male"),
                            ),
                            DropdownMenuItem(
                              value: "Female",
                              child: Text("Female"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(
                              () {
                                selectedGender = value!;
                              },
                            );
                          },
                          validator: validateGender,
                        ),
                      ),
                      Text(
                        errorText,
                        style: GoogleFonts.dmSans(
                          color: Colors.red,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Facebook Link',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: facebookController,
                            decoration: InputDecoration(
                              hintText: "facebook link",
                              hintStyle: GoogleFonts.dmSans(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'Instagram link',
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: iNstagramController,
                          decoration: InputDecoration(
                            hintText: " Enter Instagram Link",
                            hintStyle: GoogleFonts.dmSans(
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
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: const Color(0xFFA51C05),
                                  minimumSize: const Size(310, 45),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    press();
                                  }
                                },
                                child:  Text(
                                  'Save Changes',
                                  style: GoogleFonts.dmSans(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
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
