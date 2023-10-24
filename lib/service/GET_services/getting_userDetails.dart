import 'dart:convert';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:http/http.dart' as http;
// import 'package:mahi_demo/constants/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class GETUserDetails {
//   Future<Map<String, dynamic>?> getUserDetails({
//   required context,
//   required List<int> selectedCuisineIds,
// }) async {
//   try {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userId = prefs.getString("userId");

//     String baseUrl = '$KbaseUrl/user/$userId/details';

//     // Create a Map with the selectedCuisineIds
//     Map<String, dynamic> requestBody = {
//       'selectedCuisineIds': selectedCuisineIds,
//     };

//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: Kheader,
//       body: jsonEncode(requestBody),
//     );

//     if (response.statusCode == 200) {
//       Map<String, dynamic> responseData = jsonDecode(response.body);

//       if (responseData.containsKey('user') && responseData.containsKey('result')) {
//         Map<String, dynamic> user = responseData['user'];
//         Map<String, dynamic> result = responseData['result'];

//         String id = user['id'].toString();
//         String email = user['email'].toString();
//         String userName = user['userName'].toString();

//         print('ID: $id');
//         print('Email: $email');
//         print('Username: $userName');

//         return {
//           'userName': userName,
//           'email': email,
//         };
//       } else {
//         print('User data not found in the response');
//       }
//     } else {
//       print("API request failed with status code ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Exception in API call: $e");
//   }
//   return null;
// }

// }









class GETchefDetails {
  Future<Map<String, dynamic>?> getchefDetails({
    required context,
    required List<int> selectedCuisineIds,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? chefId = prefs.getString("chefId");

      String baseUrl = '$KbaseUrl/chef/$chefId/details';
          // print('dfgdgdgduserid........$chefId');
      // Create a Map with the selectedCuisineIds
      // Map<String, dynamic> requestBody = {
      //   'selectedCuisineIds': selectedCuisineIds,
      // };

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: Kheader,
        // body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
// print(responseData);

        // print("$responseData");

        if (responseData.containsKey('chefDetails')) {
          Map<String, dynamic> chef = responseData['chefDetails'];
          print(responseData['chefDetails']);
      

print('gfgfgfgfgfgfgfgfgffgf$chef');

          String id = chef['id'].toString();
          String email = chef['email'].toString();
          String userName = chef['userName'].toString();
print(id);
          // print('ID: $id');
          // print('Email: $email');
          // print('Username: $userName');


           return {
            'id': id,
            'userName': userName,
            'email': email,
            
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
