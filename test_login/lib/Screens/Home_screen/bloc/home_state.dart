part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded(this.products);

  final List<Product> products;

  @override
  List<Object> get props => [products];
}

class HomeError extends HomeState {}