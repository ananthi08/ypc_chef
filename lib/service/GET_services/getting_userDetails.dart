import 'dart:convert';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class GETUserDetails {
  Future<Map<String, dynamic>?> getUserDetails({
    required context,
    required List<int> selectedCuisineIds,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString("userId");

      String baseUrl = '$KbaseUrl/user/$userId/details';

      // Create a Map with the selectedCuisineIds
      Map<String, dynamic> requestBody = {
        'selectedCuisineIds': selectedCuisineIds,
      };

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: Kheader,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        // print("$responseData");

        if (responseData.containsKey('user') && responseData.containsKey('result')) {
          Map<String, dynamic> user = responseData['user'];
          Map<String, dynamic> result = responseData['result'];

          String id = user['id'].toString();
          String email = user['email'].toString();
          String userName = user['userName'].toString();

          // print('ID: $id');
          // print('Email: $email');
          // print('Username: $userName');

          // Loop through the keys in the result object
          result.forEach((key, value) {
          print("resukttjhbddsbcxsdcsdc$key");

            if (value is List) {
              // Assuming it's a list, you can loop through the items in the list
              for (var item in value) {
                if (item is Map) {
                  // Access properties within the map
                  String cuisineId = item['id'].toString();
                  String cuisineName = item['cuisine'].toString();
                  String imageUrl = item['imageUrl'].toString();

                  // print('Cuisine ID: $cuisineId');
                  // print('Cuisine Name: $cuisineName');
                  // print('Image URL: $imageUrl');
                }
              }
            }
          });
           return {
            'id': id,
            'userName': userName,
            'email': email,
            'cuisines': result, 
          };
        
        } else {
          print('User data not found in the response');
        }
      } else {
        print("API request failed with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Exception in API call: $e");
    }
    return null;
  }
}
