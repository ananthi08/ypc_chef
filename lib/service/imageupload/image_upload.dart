
import 'dart:convert';

import 'package:chef_frontend/constants/global_variable.dart';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
        'http://192.168.1.12:4000/ypc-authentication-micro-service/uploadimage',
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
 final String uploadUrl = UploadVideoLocal;

  Future<String> uploadVideo(XFile videoFile) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      request.headers.addAll(Kheader);

      // Create a MultipartFile from the video file
      var videoStream = http.ByteStream(videoFile.openRead());
      var videoLength = await videoFile.length();
      var videoFileName = videoFile.name;

      var videoPart = http.MultipartFile(
        'video',
        videoStream,
        videoLength,
        filename: videoFileName,
        contentType: MediaType('video', 'mp4'), 
      );

     
      request.files.add(videoPart);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
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