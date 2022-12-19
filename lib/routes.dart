import 'package:get/get.dart';
import 'package:list_animation/screen/detail.dart';
import 'package:list_animation/screen/home.dart';

class Routes {
  static String initialPage = '/home';
  static List<GetPage> routes = [
       GetPage(name: '/home', page: () => HomeScreen()),
       GetPage(name: '/detail', page: () => DetailScreen()),
  ];
}