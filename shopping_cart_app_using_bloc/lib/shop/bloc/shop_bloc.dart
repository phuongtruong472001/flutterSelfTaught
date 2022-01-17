import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/animation.dart';
import 'package:shop_cart/model/shop.dart';

import 'shop_state.dart';

class ShopBloc extends Cubit<ShopState> {
  ShopBloc() : super(ShopState([]));

 // final List<ShopItem> _drinks = ShopDataProvider.shopItems;
  List<ShopItem> carts = [];
  void addItem(ShopItem item) {
    if (!isAdded(item.id)) {
      carts.add(ShopItem(
          title: item.title,
          price: item.price,
          imageUrl: item.imageUrl,
          isChoose: item.isChoose,
          id: item.id,
          quantity: 1));
    } 
    emit(ShopState(carts));
  }
  void amountItem(ShopItem item){
    carts.firstWhere((element) => element.id == item.id).quantity+=1;
    print(item.quantity);
    emit(ShopState(carts));
  }
  void removeItem(ShopItem item){
    if(carts.firstWhere((element) => element.id == item.id).quantity>1){
      print('-');
     carts.firstWhere((element) => element.id == item.id).quantity--;
    }
    else{  
       carts.removeWhere((element)=>item.id==element.id);
    }
    emit(ShopState(carts));
  }

  bool isAdded(String id) {
    return carts.any((element) => element.id == id);
  }

  void clear() {
    carts.clear();
    emit(ShopState(carts));
  }

   double getTotalAmount() {
    double total = 0;
    for (var item in carts) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
