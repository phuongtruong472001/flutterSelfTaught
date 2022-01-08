import 'package:flutter/cupertino.dart';
import 'package:provider_state_management/Providers/drink.dart';

// class CartItem with ChangeNotifier {
//   final String id;
//   final String title;
//   final int quantity;
//   final double price;
//   final String imgUrl;
//   CartItem(
//       {required this.id,
//       required this.title,
//       required this.quantity,
//       required this.price,
//       required this.imgUrl});

//   void less(CartItem cartItem) {
//     cartItem = CartItem(
//         id: cartItem.id,
//         title: cartItem.title,
//         quantity: cartItem.quantity - 1,
//         imgUrl: cartItem.imgUrl,
//         price: cartItem.price);
//     notifyListeners();
//   }
// }

class Cart with ChangeNotifier {
  Map<String, Drink> _items = {};
  Map<String, Drink> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, drink) {
      total += drink.price * drink.quantity;
    });
    return total;
  }

  void addItem(String id, String title, double price, String imgUrl) {
    // if (_items.containsKey(id)) {
    //   _items.update(
    //       id,
    //       (existingCartItem) => CartItem(
    //           id: existingCartItem.id,
    //           title: existingCartItem.title,
    //           quantity: existingCartItem.quantity + 1,
    //           price: existingCartItem.price,
    //           imgUrl: existingCartItem.imgUrl));
    // } else {
    _items.putIfAbsent(
        id,
        () => Drink(
            id: id, title: title, quantity: 1, price: price, imageUrl: imgUrl));
    //}
    notifyListeners();
  }

  void addAmount(String id) {
    _items.update(
          id,
          (existingCartItem) => Drink(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
        notifyListeners();
  }
   void less(String id) {
    _items.update(
          id,
          (existingCartItem) => Drink(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
        notifyListeners();
  }
  void removeItem(String drinkId) {
    _items.remove(drinkId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
  void toggleAddToCardStatus(String drinkId){

    _items.update(
          drinkId,
          (existingCartItem) => Drink(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity ,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    notifyListeners();
  }
}
