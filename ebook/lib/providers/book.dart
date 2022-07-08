import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier{
  final int id;
  final String img;
  final String name;
  final String author;
  final String description;
  bool checkFavorite;
  Book(
      {required this.id,
      required this.img,
      required this.name,
      required this.author,
      required this.description,
      this.checkFavorite = false});
  void toggleChangceFavoriteStatus(){
    checkFavorite=!checkFavorite;
    notifyListeners();
  }
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json["id"],
        name: json["nameBook"],
        img: json["linkBook"],
        author: json["author"],
        description: json["contentBook"]);
  }
}
