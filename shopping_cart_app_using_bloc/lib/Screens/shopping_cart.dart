import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';
import 'package:shop_cart/shop/bloc/shop_state.dart';
import 'package:shop_cart/widgets/cart_item.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = BlocProvider.of<ShopBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFF8F5F0),
          title: Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.purple),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: BlocBuilder<ShopBloc,ShopState>(
          builder: (context, state) {
            return TextButton(
              onPressed: () {
                cartItems.clear();
              },
              child: Text("${cartItems.getTotalAmount()} vnd"),
            );
          },
        ),
        body: CartItem(cartItems: cartItems.carts));
  }
}
