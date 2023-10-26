import 'package:chef_frontend/constants/routes.dart';
import 'package:chef_frontend/service/provider/update_uploadvideo.dart';
import 'package:chef_frontend/views/dashboard/videoupload_page/uploaded_video.dart';
import 'package:chef_frontend/views/first_page_view.dart';
// import 'package:chef_frontend/views/first_page_view.dart';
// import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
// import 'package:chef_frontend/views/dashboard/uploaded_video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectedDataModel>(create: (context) => SelectedDataModel()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const UploadVideo(),
      initialRoute: Firstpage.route,
      routes: routes,
    );
  }
}
