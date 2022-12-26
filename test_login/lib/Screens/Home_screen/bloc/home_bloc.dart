import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_login/Models/product.dart';

import '../../../shopping_resposity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.shoppingRepository}) : super(HomeInitial()) {
    on<HomeStarted>(_onStarted);
  }
  final ShoppingRepository shoppingRepository;

  FutureOr<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final products = await shoppingRepository.loadListproducts();
      emit(HomeLoaded(products));
    } catch (_) {
      emit(HomeError());
    }
  }
}
