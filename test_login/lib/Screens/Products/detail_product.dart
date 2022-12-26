import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/Models/product.dart';
import 'package:test_login/Screens/Cart_screen/badge.dart';
import 'package:test_login/Screens/Cart_screen/bloc/cart_bloc.dart';

import '../Cart_screen/cart_screen.dart';

// ignore: must_be_immutable
class DetailProduct extends StatelessWidget {
  Product product;
  DetailProduct({Key? key, required this.product}) : super(key: key);

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        backgroundColor: const Color.fromARGB(255, 223, 196, 205),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 40),
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return Container(
                            color: Colors.grey,
                            height: 50,
                            child: Badge(
                              value: state is CartLoaded
                                  ? "${state.cart.products.length}"
                                  : "0",
                              child: IconButton(
                                  icon: const Icon(Icons.shopping_cart),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartScreen(),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(product.name.toString()),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                child: Hero(
                  tag: product,
                  child: Image.network(
                    product.imageLink,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.45,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 163, 147, 147),
                    border: Border.all(color: (Colors.black), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "\$ ${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(),
                      ),
                      Text("Số lượng còn lại trong kho : ${product.quantity}"),
                      Text("Đã bán : ${product.sold}"),
                      Text(product.description)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.minimize_outlined)),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                )),
                                width: 20,
                                child: Center(child: Text("$quantity")),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: (Colors.black), width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          height: 50,
                          width: 150,
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              return TextButton(
                                onPressed: () {
                                  if (state is CartLoaded) {
                                    Product temp = Product(
                                        product.name,
                                        product.description,
                                        1,
                                        product.price,
                                        product.sold,
                                        product.discount,
                                        product.brand,
                                        product.status,
                                        product.viewed,
                                        product.imageLink,
                                        product.id);
                                    final isInCart = state.cart.products
                                        .indexWhere(
                                            (element) => element.id == temp.id);
                                    print(isInCart);
                                    if (isInCart < 0) {
                                      context.read<CartBloc>().add(
                                            CartItemAdded(temp),
                                          );
                                    } else {
                                      context
                                          .read<CartBloc>()
                                          .add(CartItemIncrease(temp));
                                    }
                                  }
                                },
                                child: const Text(
                                  "ADD TO CART",
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
