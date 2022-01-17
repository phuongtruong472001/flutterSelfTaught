part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class ShopPageInitializedEvent extends CartEvent {}

class ItemAddingCartEvent extends CartEvent {
  List<Drink> cartItems;

  ItemAddingCartEvent({required this.cartItems});
}

class ItemAddedCartEvent extends CartEvent {
  List<Drink> cartItems;

  ItemAddedCartEvent({required this.cartItems});
}

class ItemDeleteCartEvent extends CartEvent {
  List<Drink> cartItems;
  int index;
  ItemDeleteCartEvent({required this.cartItems, required this.index});
}