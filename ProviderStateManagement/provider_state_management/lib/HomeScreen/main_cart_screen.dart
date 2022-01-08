import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/HomeScreen/main_home_screen.dart';
import 'package:provider_state_management/Providers/cart.dart';
import 'package:provider_state_management/Providers/drinks.dart';
import 'package:provider_state_management/Providers/orders.dart';
import '../Widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartsData = Provider.of<Cart>(context);
    final carts = cartsData.items;
    final drinks=Provider.of<Drinks>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainHome()));
            },
          ),
          title: const Text("Cart"),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Text('${cartsData.totalAmount} vnd'),
        //   onPressed: () {},
        // ),
        body: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: carts.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: carts.values.toList()[index],
                    child: CartItemWidget()),
              ),
            ),
            Container(
              
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(right: 20,bottom: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('${cartsData.totalAmount} vnd',style: const TextStyle(color: Colors.white),),
                    onPressed: () {
                      // Provider.of<Orders>(context, listen: false)
                      //     .addOrder(carts.values.toList(), cartsData.totalAmount);
                      carts.forEach((key, drink) {
                        drinks.removeItem(drink.id);
                      });
                      cartsData.clear();
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
