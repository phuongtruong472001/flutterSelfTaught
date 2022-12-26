import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/Models/product.dart';
import 'package:test_login/Screens/Cart_screen/bloc/cart_bloc.dart';

class Unpaid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          } else if (state is CartLoaded) {
            var listItems = state.cart.products;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listItems.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = listItems[index];
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: (Colors.black), width: 1),
                              ),
                              width: 50,
                              child: Image.network(product.imageLink),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      product.name,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Text(product.quantity.toString())
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  "ID Order",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(product.id,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  "Total Product",
                                  textAlign: TextAlign.left,
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
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  "Status",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text("Processing",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
