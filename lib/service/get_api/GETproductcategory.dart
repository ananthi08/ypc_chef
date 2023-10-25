import 'dart:convert';
import 'dart:developer';
import 'package:chef_frontend/constants/global_variable.dart'; 
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Map<String, dynamic>>> fetchservecategory() async {
    String baseUrl = '$getbaseUrl/ypc/product/servecategory';

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: Kheader,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // log(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data from the API. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching data: $e');
      throw Exception('An error occurred while fetching data from the API.');
    }
  }


  // fetch international cuisine




  Future<List<Map<String, dynamic>>?> fetchInternationalCuisine() async {
    String baseUrl = '$getbaseUrl/ypc/international/cuisine';

    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: Kheader,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // log(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception('Failed to load data from the API. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching : $e');
      throw Exception('An error occurred while fetching data from the API.');
    }
  }

// // fetch national cuisine 


Future<List<Map<String, dynamic>>?> fetchnationalcuisine(List<int> selectedCuisineIds) async {
  String baseUrl = '$getbaseUrl/ypc/dashboard';

 
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: Kheader,
      body: jsonEncode({"internationalCuisineId": selectedCuisineIds}),
    );
print('selecteeedidszz $selectedCuisineIds');
    if (response.statusCode == 200) {

final List<dynamic> data = json.decode(response.body);
// print('selecteeedidszz $data');

    return data
        .map((item) => {
          'id': item['id'] as int,
          'cuisine': item['cuisine'] as String,
        })
        .toList();
      } else {
        throw Exception('Failed to load data from the API. Invalid data structure.');
      }
    } 
  
}





