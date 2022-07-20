import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/product.dart';

import '../Cart_screen/badge.dart';
import '../Cart_screen/cart_screen.dart';

class DetailProduct extends StatefulWidget {
  Product product;
  DetailProduct({Key? key, required this.product}) : super(key: key);
  @override
  DetailProductPage createState() => DetailProductPage();
}

class DetailProductPage extends State<DetailProduct> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final listFavorites = Provider.of<ListFavorites>(context);
    final cartItems = Provider.of<Carts>(context);
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
                    Container(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.product.checkFavorite =
                                  !widget.product.checkFavorite;
                              if (widget.product.checkFavorite == true) {
                                listFavorites.addItem(widget.product);
                              } else {
                                listFavorites.removeItem(widget.product);
                              }
                            });
                            // print(widget.product.checkFavorite);
                          },
                          icon: widget.product.checkFavorite
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 40),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Consumer<Carts>(
                      builder: (_, cart, ch) => Badge(
                          value: cart.itemCount.toString(),
                          child: IconButton(
                              icon: const Icon(Icons.shopping_cart),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()));
                              })),
                    )),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(widget.product.toString()),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                child: Hero(
                  tag: widget.product,
                  child: Image.network(
                    widget.product.imageLink,
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
                        widget.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        "\$ " + widget.product.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.product.description,
                        style: const TextStyle(),
                      ),
                      Text("Số lượng còn lại trong kho : " +
                          widget.product.quantity.toString()),
                      Text("Đã bán : " + widget.product.sold.toString()),
                      Text(widget.product.description)
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
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },
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
                                  onPressed: () {
                                    setState(() {
                                      if (quantity < widget.product.quantity) {
                                        quantity++;
                                      }
                                    });
                                  },
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
                          child: TextButton(
                            onPressed: () {
                              cartItems.addItem(Product(
                                  id: widget.product.id,
                                  name: widget.product.name,
                                  description: widget.product.description,
                                  imageLink: widget.product.imageLink,
                                  price: widget.product.price,
                                  brand: widget.product.brand,
                                  discount: widget.product.discount,
                                  quantity: quantity,
                                  sold: widget.product.sold,
                                  viewed: widget.product.viewed));
                            },
                            child: const Text(
                              "ADD TO CART",
                              style: TextStyle(color: Colors.red),
                            ),
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
