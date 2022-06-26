import 'dart:convert';

import 'package:flutter_11_hour_lesson/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiWithHttp extends GetxController {
  List<ProductModel> listOfproductTop = <ProductModel>[].obs;
  List<ProductModel> listOfProductBottom = <ProductModel>[].obs;

  Future fetchDataFromApi() async {
    final response = await http
        .get(Uri.parse("https://mvs.bslmeiyu.com/api/v1/products/popular"));
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        List<dynamic> list = map['products'];
        for (int i = 0; i < list.length; i++) {
          listOfproductTop.add(ProductModel.fromJson(list[i]));
        }
        for (var all in listOfproductTop) {
          print(all.img);
        }
      }
    } catch (e) {
      print("not works $e");
      print(response.body);
    }
  }

  Future<void> fetchRecommended() async {
    try {
      final response = await http.get(
          Uri.parse("https://mvs.bslmeiyu.com/api/v1/products/recommended"));
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        List<dynamic> list = map['products'];
        for (int i = 0; i < list.length; i++) {
          listOfProductBottom.add(ProductModel.fromJson(list[i]));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void fetch() async {
    await fetchDataFromApi();
    await fetchRecommended();
  }

  ApiWithHttp() {
    fetch();
  }
}
