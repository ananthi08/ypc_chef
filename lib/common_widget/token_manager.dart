// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'token';

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> setUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<void> clearUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    print( "Your user token from tokenmanager is : $_tokenKey");
  }
}


class ChefIdUsage {

  static const String chefId = 'chefId';
    static Future<void> clearchefId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(chefId);
    print( "Your  chefId from tokenmanager is : $chefId");
  }

}
