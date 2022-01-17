import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart/repository/shop_data_repository.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';
import 'package:shop_cart/widgets/product_item.dart';
import 'package:shop_cart/model/shop.dart';

class DrinkGrid extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final shopItems = ShopDataProvider.shopItems;
    return GridView.builder(
        itemCount: shopItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
        itemBuilder: (ctx, index) {
          ShopItem item = shopItems[index];
          return ProductItem(
            shopItem: shopItems[index],
          );
        });
  }
}
