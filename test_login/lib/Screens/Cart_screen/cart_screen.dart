import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Screens/Cart_screen/bloc/cart_bloc.dart';
import 'package:test_login/Screens/Pay/pay_screen.dart';

import '../../Models/product.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenPage createState() => CartScreenPage();
}

class CartScreenPage extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 223, 196, 205),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: const Text(
                            "YOUR CART",
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  if (state is CartLoaded) ...[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.cart.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product item = state.cart.products[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: (Colors.black), width: 1),
                                    ),
                                    width: 50,
                                    child: Image.network(item.imageLink ,),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        item.name ,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.minimize_outlined,
                                              size: 10,
                                            )),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 1,
                                            color: Colors.black,
                                          )),
                                          width: 20,
                                          child: Center(
                                              child: Text(
                                                  item.quantity.toString())),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              // setState(() {
                                              //   cartItems.addAmount(item);
                                              // });
                                            },
                                            icon: const Icon(Icons.add,
                                                size: 10)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    CircularProgressIndicator()
                  ],
                  if (state is CartLoading) ...{
                    const CircularProgressIndicator(),
                  } else if (state is CartLoaded) ...{
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "Total bill",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(state.cart.totalPrice.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  } else ...{
                    const Text('Something went wrong!'),
                  },
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: (Colors.black), width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PayScreen()));
                        },
                        child: const Text(
                          "PAY",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
