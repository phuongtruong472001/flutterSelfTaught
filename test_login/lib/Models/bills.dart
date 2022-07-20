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
  String address;
  String phone;
  var items;
  Bill({required this.id, required this.items, required this.address, required this.phone});
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(id: json["id"], items: json["product"],address: json["address"],phone: json["phone"]);
  }
}

class ItemBills with ChangeNotifier {
  final List<Bill> _bills = [];
  List<Bill> get bills {
    return [..._bills];
  }

  // String _phone = "", _address = "";
  // String get phone {
  //   return _phone;
  // }

  // String get address {
  //   return _address;
  // }

  Future<void> fetchBillItems() async {
    String url = API().api_bill;
    try {
      // EasyLoading.show(status: "Đang lấy thông tin ");
      final response = await http.get(Uri.parse(url));
      var listproducts = convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
      //listproducts = listproducts["product"];
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
