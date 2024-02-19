import 'package:chef_frontend/constants/routes.dart';
import 'package:chef_frontend/service/post_api/image_upload_provider.dart';
import 'package:chef_frontend/service/provider/update_uploadvideo.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
import 'package:chef_frontend/views/first_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? chefId = prefs.getString("chefId");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedDataModel>(create: (context) => SelectedDataModel()),
        ChangeNotifierProvider(create: (context) => ImageUploadProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 191, 13, 0)),
          useMaterial3: true,
        ),
        initialRoute: chefId != null ? Dashboardview.route : Firstpage.route,
        routes: routes,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 191, 13, 0)),
        useMaterial3: true,
      ),
      initialRoute: Firstpage.route,
      routes: routes,
    );
  }
}
