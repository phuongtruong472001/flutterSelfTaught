
import 'package:flutter/cupertino.dart';

class Book with ChangeNotifier{
  final String img;
  final String name;
  final String author;
  final String description;
  bool checkFavorite;
  Book({required this.img,required this.name,required this.author,required this.description,this.checkFavorite=false});
  void toggleChangceFavoriteStatus(){
    checkFavorite=!checkFavorite;
    notifyListeners();
  }

}