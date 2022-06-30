import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_11_hour_lesson/models/app_colors.dart';
import 'package:flutter_11_hour_lesson/models/cart_model.dart';
import 'package:flutter_11_hour_lesson/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiWithHttp extends GetxController {
  List<ProductModel> listOfproductTop = <ProductModel>[].obs;
  List<ProductModel> listOfProductBottom = <ProductModel>[].obs;
  RxInt qty = 0.obs;
  RxInt incartItems = 0.obs;
  Map<int, CartModel> items = <int, CartModel>{}.obs;

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

  void setQuantity(bool isIncrement) {
    if (isIncrement == true) {
      qty >= 20
          ? Get.snackbar('Item count', 'you cant add more',
              duration: const Duration(seconds: 2),
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white)
          : qty++;
    } else {
      qty <= 0
          ? Get.snackbar('Item count', 'you cant add more',
              duration: const Duration(seconds: 2),
              backgroundColor: AppColors.mainColor,
              colorText: Colors.white)
          : qty--;
    }
  }

  void initProduct() {
    qty = 0.obs;
    incartItems = 0.obs;
  }

  void setQty(int number)
  {
    qty = number.obs;
  }

  void addItem(ProductModel productModel, RxInt quantity) {
    if (quantity <= 0) {
      Get.snackbar("Error", "Add item first");
      return;
    }
    if (items.containsKey(productModel.id)) {
      print("object");
      items.update(
          productModel.id!,
          (value) => CartModel(
              id: value.id,
              name: value.name,
              price: value.price,
              img: value.img,
              qty: quantity,
              time: DateTime.now().toString(),
              isExist: true));
      Get.snackbar("This is", "Update");
      return;
    }
    Get.snackbar("This is", "add");
    items.putIfAbsent(
        productModel.id!,
        () => CartModel(
            id: productModel.id,
            name: productModel.name,
            price: productModel.price,
            img: productModel.img,
            qty: quantity,
            time: DateTime.now().toString(),
            isExist: true));

    initProduct();
  }

  void deleteItem(ProductModel productModel) {
    items.removeWhere((key, value) => key == productModel.id);
  }
}
