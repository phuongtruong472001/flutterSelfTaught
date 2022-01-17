import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/BloC/cart_bloc.dart';
import 'package:my_app/BloC/drink.dart';
import '../Widgets/cart_item.dart';
import 'main_home_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  late List<Drink> cartItems;
  double totalAmount = 0;
  void calculateTotalAmount(List<Drink> list) {
    double res = 0;

    list.forEach((element) {
      res = res + element.price * element.quantity;
    });
    totalAmount = res;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, CartState>(
      builder: (context, state) {
        if (state is ItemAddedCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
        if (state is ShopPageLoadedState) {
          cartItems = state.drinks.shopitems;
          calculateTotalAmount(cartItems);
        }
        if (state is ItemDeletingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }

        if (state is ItemAddingCartState) {
          cartItems = state.cartItems;
          calculateTotalAmount(cartItems);
        }
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
        body: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index){
                    
                    return CartItemWidget(cartItems[index]);}
              ),
            ),
            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      '$totalAmount vnd',
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      
                      
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  });
  }
}
