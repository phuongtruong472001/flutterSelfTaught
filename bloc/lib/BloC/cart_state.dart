part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class ShopInitial extends CartState {}

class ShopPageLoadedState extends CartState {
  Drinks drinks;
  Drinks cart;

  ShopPageLoadedState({required this.drinks, required this.cart});
}

class ItemAddingCartState extends CartState {
  List<Drink> cartItems;

  ItemAddingCartState({required this.cartItems});
}

class ItemAddedCartState extends CartState {
  List<Drink> cartItems;

  ItemAddedCartState({required this.cartItems});
}

class ItemDeletingCartState extends CartState {
  List<Drink> cartItems;

  ItemDeletingCartState({required this.cartItems});
}
