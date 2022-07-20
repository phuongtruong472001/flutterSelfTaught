import 'dart:convert' as convert;
import 'dart:convert' show utf8;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';

class Category {
  String id;
  String name;
  String description;
  String imageLink;
  Category({required this.id, required this.name, required this.description, required this.imageLink});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json["id"], name: json["name"], description: json["description"], imageLink: json["imageLink"]);
  }
}

class Categories with ChangeNotifier {
  final List<Category> _categories = [];
  List<Category> get categories {
    return [..._categories];
  } 

  Future<void> fetchCategories() async {
    // Map<String, String> headers = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $token'
    // };
    String url = API().api_categories;
    try {
      // EasyLoading.show(status: "Đang lấy thông tin ");
      final response = await http.get(Uri.parse(url));
      var listCategories = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var element in listCategories) {
        _categories.add(Category.fromJson(element));
       
      }
      //  EasyLoading.dismiss();
      notifyListeners();
    } catch (error) {
      //EasyLoading.showError("Đã có lỗi xảy ra\nVui lòng thử lại sau");
      print("lỗi rồi");
    }
  }
}
