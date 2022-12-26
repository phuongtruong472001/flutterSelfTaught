import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_login/Models/product.dart';

import '../../../shopping_resposity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartInitial()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemIncrease>(_onItemIncrease);
    on<CartItemRemoved>(_onItemRemoved);
  }
  final ShoppingRepository shoppingRepository;

  FutureOr<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final products = await shoppingRepository.loadCartproducts();
      emit(CartLoaded(cart: Cart(products: [...products])));
    } catch (_) {
      emit(CartError());
    }
  }

  FutureOr<void> _onItemAdded(
      CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addproductToCart(event.product);
        emit(
          CartLoaded(
            cart: Cart(products: [...state.cart.products, event.product]),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  FutureOr<void> _onItemIncrease(
      CartItemIncrease event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.increaseQuantity(event.product);
        emit(
          CartLoaded(
            cart: Cart(products: [...state.cart.products]),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  FutureOr<void> _onItemRemoved(
      CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeproductFromCart(event.product);
        emit(CartLoaded(
          cart: Cart(
            products: [...state.cart.products]..remove(event.product),
          ),
        ));
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
