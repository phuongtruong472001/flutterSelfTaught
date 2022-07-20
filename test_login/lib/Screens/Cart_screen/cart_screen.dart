import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Screens/Pay/pay_screen.dart';

import '../../Models/product.dart';

class CartScreen extends StatefulWidget {
  @override
  CartScreenPage createState() => CartScreenPage();
}

class CartScreenPage extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Carts>(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 223, 196, 205),
            body: SingleChildScrollView(
                child: Column(children: [
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cartItems.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product item = cartItems.products.values.toList()[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: (Colors.black), width: 1),
                              ),
                              width: 50,
                              child: Image.network(item.imageLink),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  item.name,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (item.quantity > 1) {
                                            cartItems.less(item);
                                          } else {
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: Text('Confirm Delete ' +
                                                    item.name),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      cartItems
                                                          .removeItem(item.id);
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                    child: const Text('Remove'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        });
                                      },
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
                                        child: Text(item.quantity.toString())),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartItems.addAmount(item);
                                        });
                                      },
                                      icon: const Icon(Icons.add, size: 10)),
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
                          child: Text(cartItems.totalAmount.toString(),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PayScreen()));
                    },
                    child: const Text(
                      "PAY",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              )
            ]))));
  }
}
