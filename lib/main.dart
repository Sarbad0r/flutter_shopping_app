import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/pages/home/main_food_page.dart';
import 'package:flutter_11_hour_lesson/pages/screens/popular_food.dart';
import 'package:flutter_11_hour_lesson/widgets/recomended_food_detail.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: RecommendedFoodDetail(),
  ));
}
