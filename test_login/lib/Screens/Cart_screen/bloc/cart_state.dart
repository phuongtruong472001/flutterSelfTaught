part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});
  @override
  // TODO: implement props
  List<Object?> get props => [cart];
}

class CartError extends CartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
