 import 'dart:convert';
class Area {
  String code;
  String name;
  
  Area({required this.code, required this.name});
  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(code:json["code"] , name:  json["name"]);
  }
  
}

