import 'dart:convert';

import 'package:chef_frontend/constants/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class GetFollowersDetails {
  Future<List<USERFOLLOWMODEL>?> getDetailsOfFollowers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? chefId = prefs.getString("chefId");
      String baseUrl = '$kbaseUrl/customer/detail/$chefId';

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: kHeader,
      );

      if (response.statusCode == 200) {
        List<USERFOLLOWMODEL> followersList = [];

        List<dynamic> userDetails = jsonDecode(response.body)['userDetails'];

        for (var user in userDetails) {
          USERFOLLOWMODEL follower = USERFOLLOWMODEL.fromJson(user);
          followersList.add(follower);
        }

        return followersList;
      } else {
        print("API request failed with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }

    return null;
  }
}

class USERFOLLOWMODEL {
  final String? userType;
  final String? userName;
  final String? email;
  final String? imageUrl;

  final String? followingChefId;

  USERFOLLOWMODEL({
    this.userType,
    this.userName,
    this.email,
    this.imageUrl,
    this.followingChefId,
  });

  factory USERFOLLOWMODEL.fromJson(Map<String, dynamic> json) {
    return USERFOLLOWMODEL(
      userType: json['userType'].toString(),
      userName: json['userName'].toString(),
      email: json['email'].toString(),
      imageUrl: json['imageUrl'].toString(),
      followingChefId: json['followingChefId'].toString(),
    );
  }
}
