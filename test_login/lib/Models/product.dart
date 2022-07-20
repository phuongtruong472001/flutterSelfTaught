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
      final response = await http.get(Uri.parse(url));
      final listproducts = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
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

class ListFavorites with ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products {
    return [..._products];
  }

  void addItem(Product item) {
    _products.add(item);
    notifyListeners();
  }

  void removeItem(Product item) {
    _products.remove(item);
    notifyListeners();
  }
}

class Carts with ChangeNotifier {
  Map<String, Product> _products = {};
  Map<String, Product> get products {
    return {..._products};
  }

  void addItem(Product item) {
    // if (_products.containsKey(id)) {
    //   _items.update(
    //       id,
    //       (existingCartItem) => CartItem(
    //           id: existingCartItem.id,
    //           title: existingCartItem.title,
    //           quantity: existingCartItem.quantity + 1,
    //           price: existingCartItem.price,
    //           imgUrl: existingCartItem.imgUrl));
    // } else {
    _products.putIfAbsent(
        item.id,
        () => item);
    //}
    notifyListeners();
  }

  void addAmount(Product item) {
    _products.update(
        item.id,
        (existingCartItem) => Product(
        id:item.id ,
        name: item.name,
        description: item.description,
        imageLink: item.imageLink,
        brand: item.brand,
        discount: item.discount,
        price: item.price,
        quantity: item.quantity+1,
        sold: item.sold,
        viewed:item.viewed ));
    notifyListeners();
  }

  void less(Product item) {
    _products.update(
        item.id,
        (existingCartItem) => Product(
            id:item.id ,
        name: item.name,
        description: item.description,
        imageLink: item.imageLink,
        brand: item.brand,
        discount: item.discount,
        price: item.price,
        quantity: item.quantity-1,
        sold: item.sold,
        viewed:item.viewed ));
    notifyListeners();
  }

  void removeItem(String ProductId) {
    _products.remove(ProductId);
    notifyListeners();
  }
  int get totalAmount {
    int total = 0;
    _products.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void clear() {
    _products = {};
    notifyListeners();
  }

  // void toggleAddToCardStatus(String ProductId) {
  //   _products.update(
  //       ProductId,
  //       (existingCartItem) => Product(
  //           id: existingCartItem.id,
  //           title: existingCartItem.title,
  //           quantity: existingCartItem.quantity,
  //           price: existingCartItem.price,
  //           imageUrl: existingCartItem.imageUrl));
  //   notifyListeners();
  // }
}
