import 'package:chef_frontend/views/auth/signin/forgotpassword_view.dart';
import 'package:chef_frontend/views/auth/signin/resetpassword_view.dart';
import 'package:chef_frontend/views/auth/signin/signin_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:chef_frontend/views/first_page_view.dart';
import 'package:chef_frontend/views/dashboard/my_videos/my_videos_page_1.dart';
import 'package:chef_frontend/views/dashboard/my_videos/video_page2.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Dashboardview.route: (context) => const Dashboardview(),
  UploadVideo.route: (context) => const UploadVideo(),
  Signin.route: (context) => const Signin(),
  Firstpage.route: (context) => const Firstpage(),
  Profilepage.route: (context) => const Profilepage(),
  Forgot.route: (context) => const Forgot(),
  Reset.route: (context) => const Reset(),
  Myvideospage.route: (context) => const Myvideospage(),
  Myvideospage2.route: (context) => const Myvideospage2(),



};
