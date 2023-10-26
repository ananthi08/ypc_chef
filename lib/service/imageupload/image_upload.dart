import 'package:chef_frontend/constants/global_variable.dart';
import 'package:dio/dio.dart';

class YourApiService {
  final Dio _dio = Dio(); 

  Future<String> uploadImage(String imageName) async {
    try {
      FormData formData = FormData.fromMap({
        'image_name': imageName,
  
      });

      final response = await _dio.post(
        'http://192.168.1.12:4000/ypc-authentication-micro-service/uploadVideolocal',
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


// 


Future<String> uploadVideo(String videoPath) async {
    try {
      FormData formData = FormData.fromMap({
        'video': await MultipartFile.fromFile(videoPath),
      });
print('pathaaaa$videoPath');

 Options options = Options(headers: Kheader);


      final response = await _dio.post(
        'http://192.168.1.12:4000/ypc-authentication-micro-service/uploadVideolocal',
        options: options,
        
        data: formData, 
      );
      print('forrrrrm dataaaaaa$formData');

      if (response.statusCode == 200) {
        return 'Video uploaded successfully';
      } else {
        return 'Video upload failed. Status code: ${response.statusCode}';
      }
    } catch (error) {
      return 'Error uploading video: $error';
    }
  }






  
}