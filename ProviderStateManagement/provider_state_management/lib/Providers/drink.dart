
import 'package:flutter/cupertino.dart';


class Drink with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isChoose;

  Drink({required this.id,required this.title,required this.price,required this.imageUrl,this.isChoose=false});

  void toggleAddToCardStatus(){
    isChoose=true;
    notifyListeners();
  }
 
}
