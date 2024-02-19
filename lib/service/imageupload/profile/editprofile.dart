import 'dart:convert';

import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/post_api/image_upload_provider.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboard_editprofile_view.dart';
import 'package:chef_frontend/views/dashboard/dashboard_top_profile/dashboardprofile_View.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile {
  void editprofile({
    required context,
    required String gender1,
    required String email1,
    required String whatsAppNumber1,
    required String facebookLink1,
    required String instagramLink1,
    required String name1,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? chefId = prefs.getString("chefId");
      String baseUrl = '$kbaseUrl/chef/profile/$chefId';

      Object? body = {
        'email': email1,
        'gender': gender1,
        'userName': name1,
        'whatsAppNumber': whatsAppNumber1,
        'instagramLink': instagramLink1,
        'facebookLink': facebookLink1,
        'imageUrl': Provider.of<ImageUploadProvider>(context, listen: false).propicUrl,
      };

  

      http.Response response = await http.put(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var userID = jsonDecode(response.body)['user_Id'];
        await prefs.setString("user_Id", "$userID");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profilepage()),
        );
      } else {
        print("${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
