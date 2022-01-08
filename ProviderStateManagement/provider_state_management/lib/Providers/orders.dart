import 'package:flutter/cupertino.dart';
import 'package:provider_state_management/Providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> drinks;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.drinks,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartDrinks, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            drinks: cartDrinks));
    notifyListeners();
  }
  
}
