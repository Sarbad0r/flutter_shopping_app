import 'package:flutter_11_hour_lesson/controllers/popular_product_controller.dart';
import 'package:flutter_11_hour_lesson/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/api/api_clien.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUr: 'https://mvs.bslmeiyu.com'));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
