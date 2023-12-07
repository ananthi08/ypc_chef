import 'dart:convert';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GETchefDetails {
  Future<Map<String, dynamic>?> getchefDetails({
    required context,
    required List<int> selectedCuisineIds,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? chefId = prefs.getString("chefId");
      String baseUrl = '$kbaseUrl/chef/$chefId/details';

print("chefIdchefIdchefId$chefId") ;     final response = await http.get(
        Uri.parse(baseUrl),
        headers: kHeader,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData.containsKey('chefDetails')) {
          Map<String, dynamic> chef = responseData['chefDetails'];
          print(responseData['chefDetails']);

          String id = chef['id'].toString();
          String email = chef['email'].toString();
          String userName = chef['userName'].toString();

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



  Future<List<Map<String, dynamic>>?>   fethallvideos() async {


  SharedPreferences prefs = await SharedPreferences.getInstance();

  
  String? chefId = prefs.getString("chefId");
  // String baseUrl = '$kbaseUrl/ypc/chef/allvideos/1';
  String baseUrl = '$kbaseUrl/ypc/chef/allvideos/$chefId';


  try {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: kHeader,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Log the response for debugging
      // print(data);

      if (data['productDetails'] is List) {
        List<Map<String, dynamic>> videosList = List<Map<String, dynamic>>.from(
          data['productDetails'],
        );
        // print('videooooooo$videosList');
        return videosList;
      } else {
        throw Exception('Invalid data format from the API');
      }
    } else {
      throw Exception('Failed to load data from the API. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching: $e');
    throw Exception('An error occurred while fetching data from the API.');
  }
}

}
