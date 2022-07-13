import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';

class ItemBill {
  String id;
  String name;
  int quantity;
  String image;
  int price;
  ItemBill(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.image,
      required this.price});
}

class Bill {
  String id;
  var items;
  Bill({required this.id, required this.items});
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(id: json["id"], items: json["product"]);
  }
}

class ItemBills with ChangeNotifier {
  final List<Bill> _bills = [];
  List<Bill> get bills {
    return [..._bills];
  }

  Future<void> fetchBillItems() async {
    String url = API().api_bill;
    try {
      // EasyLoading.show(status: "Đang lấy thông tin ");
      final respone = await http.get(Uri.parse(url));
      final listproducts = convert.jsonDecode(respone.body);
      for (var element in listproducts) {
        _bills.add(Bill.fromJson(element));
        // print(element);
      }
      //  EasyLoading.dismiss();
      notifyListeners();
    } catch (error) {
      //EasyLoading.showError("Đã có lỗi xảy ra\nVui lòng thử lại sau");
      print("lỗi rồi");
    }
  }
}
