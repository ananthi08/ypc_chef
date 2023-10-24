import 'package:dio/dio.dart';

class YourApiService {
  final Dio _dio = Dio(); 

  Future<String> uploadImage(String imageName) async {
    try {
      FormData formData = FormData.fromMap({
        'image_name': imageName,
  
      });

      final response = await _dio.post(
        'http://192.168.0.114:4000/ypc-authentication-micro-service/upload',
        data: formData, 
      );

      if (response.statusCode == 200) {
        return 'Image uploaded successfully';
      } else {
        return 'Image upload failed. Status code: ${response.statusCode}';
      }
    } catch (error) {
      return 'Error uploading image: $error';
    }
  }
}
