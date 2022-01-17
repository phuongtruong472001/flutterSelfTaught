import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/BloC/drink.dart';
import 'package:my_app/BloC/drinks.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class ShopBloc extends Bloc<CartEvent, CartState> {
  DrinksProvider shopDataProvider = DrinksProvider();
  ShopBloc() : super(ShopInitial()) {
    add(ShopPageInitializedEvent());
  }
//
  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is ShopPageInitializedEvent) {
      Drinks shopData = await shopDataProvider.getDrinks();
      Drinks cartData = await shopDataProvider.getCartItems();
      yield ShopPageLoadedState(drinks: shopData, cart: cartData);
    }
    if (event is ItemAddingCartEvent) {
      yield ItemAddingCartState(cartItems:  event.cartItems);
    }
    if (event is ItemAddedCartEvent) {
      yield ItemAddedCartState(cartItems: event.cartItems);
    }
    if (event is ItemDeleteCartEvent) {
      yield ItemDeletingCartState(cartItems: event.cartItems);
    }
  }
}