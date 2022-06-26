import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/controllers/popular_product_controller.dart';
import 'package:flutter_11_hour_lesson/data/api/api_with_http.dart';
import 'package:flutter_11_hour_lesson/pages/home/main_food_page.dart';
import 'package:flutter_11_hour_lesson/pages/screens/popular_food.dart';
import 'package:flutter_11_hour_lesson/widgets/recomended_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  // Get.find<PopularProductController>().getPopularProductList();
  HttpOverrides.global = MyHttpOverrides();
  // Get.put(ApiWithHttp());
  
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: MainFoodPage(),
  ));
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
