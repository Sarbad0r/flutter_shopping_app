import 'package:flutter_11_hour_lesson/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProduct = [];
  List<dynamic> get popularProduct => _popularProduct;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProduct = [];
      print('works');
      _popularProduct.addAll(Product.fromJson(response.body).product);
      update();
    } else {
      print('not works');
    }
  }
}
