import 'package:chef_frontend/constants/httperrorhandling.dart';
import 'package:chef_frontend/model/VU_datamodel/datamodel.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:chef_frontend/constants/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FormfieldApi {

Future<void> dataload({
    required String productname,
    required String diettype,
    required String category,
   
    required String international,
    required String national,
    required String productserve,

    required List<Map<String, dynamic>> ingredients, 
    required BuildContext context,
  }) async {
    try {
       SharedPreferences prefs = await SharedPreferences.getInstance();
        String? chefId = prefs.getString("chefId");

        chefId = prefs.getString("chefId");
      // String baseUrl = '$KbaseUrl/ypc/chef/upload/1';
      String baseUrl = '$KbaseUrl/ypc/chef/upload/$chefId';



  Videodata uploadvideodata = Videodata(
        productname: productname,
        diettype: diettype,
       category:category,
        international: international,
        national: national,
        productserve: productserve,
        ingredients: ingredients,

      );

      print('productname///////////$productname');
      print('diettype///////////////$diettype');
      print('category///////////////$category');
      print('international/////////////$international');
      print('national///////////////$national');
      print('productserve//////////////$productserve');


       http.Response response = await http.post(
        Uri.parse(baseUrl),
        headers: Kheader,
        body: uploadvideodata.toJson(),
        
      );
    


     // ignore: use_build_context_synchronously
     httpErroHandle(
        context: context,
        response: response,
        onSuccess: () async {

          print("all suceesand uploaded data");
        },
      );
    } catch (e) {
      // Handle errors
    }
  }




}