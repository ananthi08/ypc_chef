import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/dashboard/uploaded_video.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Dashboardview.route : (context) => const Dashboardview(),
    UploadVideo.route : (context) => const UploadVideo(),
 
};
