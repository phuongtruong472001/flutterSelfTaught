import 'package:flutter/foundation.dart';
class Food {
  
  final int id;
  final String foodName;
  final String img;
  final String material;
  final String recipes;
  final String nutrition;
  final String publicId;

  Food({this.id, this.foodName, this.img, this.material, this.recipes, this.nutrition, this.publicId});


  factory Food.fromJson(Map<String,dynamic> json){
    return Food(
      id : json['id'] as int,
      foodName : json['foodName'] as String,
      img : json['img'] as String,
      material : json['material'] as String,
      recipes : json['recipes'] as String,
      nutrition : json['nutrition'] as String,
      publicId : json['publicId'] as String,
    );
  }
}