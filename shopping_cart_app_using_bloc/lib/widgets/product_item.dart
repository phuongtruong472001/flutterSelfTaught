import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/model/shop.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';
import 'package:shop_cart/shop/bloc/shop_state.dart';

class ProductItem extends StatelessWidget {
  final ShopItem shopItem;
  ProductItem({required this.shopItem});
  @override
  Widget build(BuildContext context) {
    final cartItems = BlocProvider.of<ShopBloc>(context);
    return Stack(
      children: <Widget>[
        Image.network(shopItem.imageUrl),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            width: double.infinity,
            color: Colors.black38,
            child: ListTile(
                title: Text(
                  shopItem.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  '${shopItem.price} vnd',
                  style: const TextStyle(color: Colors.white),
                ),
                trailing:
                    BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
                  return IconButton(
                      icon: Icon(cartItems.isAdded(shopItem.id)
                          ? Icons.check
                          : Icons.add),
                      onPressed: () {
                        cartItems.addItem(shopItem);
                      });
                })),
          ),
        )
      ],
    );
  }
}

