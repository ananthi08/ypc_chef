import 'dart:convert';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:chef_frontend/service/post_api/product_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetVideoByUrl {
  Future<ProductDetail> selectedVideoUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? chefId = prefs.getString("chefId");
    String baseUrl = '$kbaseUrl/chef/productdetails/$chefId';

    String? selectedVideoUrl = prefs.getString('videoUrl');

    if (selectedVideoUrl != null) {
      final Map<String, String> requestBody = {
        'videoUrl': selectedVideoUrl,
      };

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: kHeader,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedResponse = json.decode(response.body);

        if (parsedResponse.containsKey('productDetails')) {
          final dynamic productDetailsJson = parsedResponse['productDetails'];
// print("okokokokookokoook$productDetailsJson");
          return ProductDetail.fromJson(productDetailsJson);
        } else {
          throw Exception("Key 'productDetails' not found in the response.");
        }
      } else {
        throw Exception(
            "Failed to load video details. Status code: ${response.statusCode}");
      }
    } else {
      throw Exception("Selected video URL is null.");
    }
  }
}
