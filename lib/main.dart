import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:list_animation/routes.dart';
import 'package:list_animation/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Playfair Display',
      ),
      home: HomeScreen(),
      getPages: Routes.routes,
      initialRoute: Routes.initialPage,
    );
  }
}
