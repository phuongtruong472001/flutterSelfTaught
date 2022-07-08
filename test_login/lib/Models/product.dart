import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';

class Product with ChangeNotifier {
  String id;
  String name;
  String description;
  int quantity;
  int price;
  int sold;
  int discount;
  String brand;
  int viewed;
  String imageLink;
  bool checkFavorite;
  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageLink,
      required this.price,
      required this.brand,
      required this.discount,
      required this.quantity,
      required this.sold,
      required this.viewed,
      this.checkFavorite = false});
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageLink: json["imageLink"],
        brand: json["brand"],
        discount: json["discount"],
        price: json["price"],
        quantity: json["quantity"],
        sold: json["sold"],
        viewed: json["viewed"]);
  }
  
}

class Products with ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProduct() async {
    // Map<String, String> headers = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $token'
    // };
    String url = API().api_product;
    try {
      // EasyLoading.show(status: "Đang lấy thông tin ");
      final respone = await http.get(Uri.parse(url));
      final listproducts = convert.jsonDecode(respone.body);
      for (var element in listproducts) {
        _products.add(Product.fromJson(element));
      }
      //  EasyLoading.dismiss();
      notifyListeners();
    } catch (error) {
      //EasyLoading.showError("Đã có lỗi xảy ra\nVui lòng thử lại sau");
      print("lỗi rồi");
    }
  }
}
