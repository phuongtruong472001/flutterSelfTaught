import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/BloC/cart_bloc.dart';
import 'package:my_app/BloC/drink.dart';
import 'package:my_app/Widgets/item_drink_ui.dart';
class DrinkGrid extends StatefulWidget{
  @override
  DrinkGridState createState() =>DrinkGridState();

}

class DrinkGridState extends State<DrinkGrid> {
  bool loadingData = true;
  List<Drink> _cartItems = [];
  late List<Drink> shopItems;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ShopBloc, CartState>(
      listener: (context, state) {
        if (state is ShopInitial) {
          loadingData = true;
        } else if (state is ShopPageLoadedState) {
          shopItems = state.drinks.shopitems;
          _cartItems = state.cart.shopitems;
          loadingData = false;
        }
        if (state is ItemAddedCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
        if (state is ItemDeletingCartState) {
          _cartItems = state.cartItems;
          loadingData = false;
        }
      },
    child:  BlocBuilder<ShopBloc, CartState>(
        builder: (context, state) {
          return GridView.builder(
      itemCount: shopItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
      itemBuilder: (ctx, index) {
        return ItemDrinkScreen(shopItems[index]);}
    );
  })
    );
}
}