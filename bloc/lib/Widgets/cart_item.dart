import 'package:flutter/material.dart';
import 'package:my_app/BloC/drink.dart';

class CartItemWidget extends StatelessWidget {
  Drink cartItem;

  CartItemWidget(this.cartItem,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
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
                            
                          },
                          icon: const Icon(Icons.horizontal_rule_outlined))),
                  Text('${cartItem.quantity}'),
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                           
                          },
                          icon: const Icon(Icons.add))),
                ],
              ),
            ),
          )),
    );
  }
}
