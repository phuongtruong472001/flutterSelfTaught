import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/cart.dart';
import 'package:provider_state_management/Providers/drink.dart';
import 'package:provider_state_management/Providers/drinks.dart';

class CartItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = Provider.of<Drink>(context);
    final drinks=Provider.of<Drinks>(context);
    return SizedBox(
      height: 100,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.network(cartItem.imageUrl),
            title: Text(cartItem.title),
            subtitle: Text('${cartItem.price * cartItem.quantity}'),
            trailing: Container(
              width: 120,
              child: Row(
                children: <Widget>[
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            if (cartItem.quantity == 1) {
                              cart.removeItem(cartItem.id);
                              drinks.removeItem(cartItem.id);
                            } else {
                              cart.less(cartItem.id);
                            }
                          },
                          icon: const Icon(Icons.horizontal_rule_outlined))),
                  Text('${cartItem.quantity}'),
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            cart.addAmount(cartItem.id);
                          },
                          icon: const Icon(Icons.add))),
                ],
              ),
            ),
          )),
    );
  }
}
