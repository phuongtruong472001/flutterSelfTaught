import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/model/shop.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';
import 'package:shop_cart/shop/bloc/shop_state.dart';
import 'package:shop_cart/widgets/badges.dart';
import 'package:shop_cart/widgets/drink_grid.dart';
import 'shopping_cart.dart';

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
            return Badge(
                value: state.carts.length,
                iconButton: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<ShopBloc>(context),
                                  child: ShoppingCart())));
                    }));
          })
        ],
      ),
      body: DrinkGrid(),
    );
  }
}
