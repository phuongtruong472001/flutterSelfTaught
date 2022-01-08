import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/cart.dart';
import '../Providers/drink.dart';

class ItemDrinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drink = Provider.of<Drink>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return Stack(
      children: <Widget>[
        Image.network(drink.imageUrl),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            width: double.infinity,
            color: Colors.black38,
            child: ListTile(
              title: Text(
                drink.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              subtitle: Text(
                '${drink.price} vnd',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: Icon(drink.isChoose ? Icons.check : Icons.add),
                onPressed: () {
                  drink.toggleAddToCardStatus();
                  cart.addItem(
                      drink.id, drink.title, drink.price, drink.imageUrl);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
