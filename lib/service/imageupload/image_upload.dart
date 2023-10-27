
import 'package:chef_frontend/constants/global_variable.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourApiService {
  final Dio _dio = Dio(); 

  Future<String> uploadImage(String imageName) async {
    try {
      FormData formData = FormData.fromMap({
        'image': imageName,
  
      });
      print('imageeeeeeeee nameeeeeee$imageName');
 Options options = Options(headers: Kheader);

      final response = await _dio.post(
        'http://192.168.0.130:4000/ypc-authentication-micro-service/uploadimage',
        options: options,

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

// /////////video upload
Future<String> uploadVideo(String videoPath) async {
    try {
      FormData formData = FormData.fromMap({
        'video': await MultipartFile.fromFile(videoPath),
      });
print('pathaaaa$videoPath');

 Options options = Options(headers: Kheader);


      final response = await _dio.post(
        'http://192.168.0.130:4000/ypc-authentication-micro-service/uploadVideolocal',
        options: options,
        
        data: formData, 
      );
      print('forrrrrm dataaaaaa$formData');

      if (response.statusCode == 200) {
Map<String, dynamic> responseData = response.data;
  String filePath = responseData['filePath']; 

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('filePath', filePath);
            filePath = prefs.getString('filePath') ?? '';


          
   
      print('Video uploaded successfully. File path: $filePath');
        
        return 'Video uploaded successfully';
      } else {
        return 'Video upload failed. Status code: ${response.statusCode}';
      }
    } catch (error) {
      return 'Error uploading video: $error';
    }
  }






  
}