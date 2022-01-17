import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/model/shop.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';

class CartItem extends StatelessWidget {
  final List<ShopItem> cartItems;
  CartItem({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          ShopItem item = cartItems[index];
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              leading: Image.network(item.imageUrl),
              title: Text(item.title),
              subtitle: Text('\$${item.price * item.quantity} '),
              trailing: Container(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        BlocProvider.of<ShopBloc>(context).removeItem(item);
                      },
                    ),
                    SizedBox(
                      height: 20,
                      width: 30,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
                        child: Text(
                          "${item.quantity}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        BlocProvider.of<ShopBloc>(context,listen: false).amountItem(item);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
