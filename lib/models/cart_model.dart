
import 'package:get/get.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  RxInt? qty;
  bool? isExist;
  String? time;
  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.qty,
      this.time,
      this.isExist
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    qty = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['quantity'] = qty;
    data['isExist'] = isExist;
    data['time'] - time;
    return data;
  }
}