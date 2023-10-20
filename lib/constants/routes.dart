import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/auth/signin/resetpassword_view.dart';
import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/uploaded_video.dart';
import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Dashboardview.route: (context) => const Dashboardview(),
  UploadVideo.route: (context) => const UploadVideo(),
  Signin.route: (context) => const Signin(),
  Firstpage.route: (context) => const Firstpage(),
  Profilepage.route: (context) => const Profilepage(),
  Forgot.route: (context) => const Forgot(),
  Reset.route: (context) => const Reset(),
};
