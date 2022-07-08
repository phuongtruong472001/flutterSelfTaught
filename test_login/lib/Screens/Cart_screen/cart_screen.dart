import 'package:flutter/material.dart';

class CartSreen extends StatefulWidget {
  @override
  CartScreenPage createState() => CartScreenPage();
}

class CartScreenPage extends State<CartSreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 223, 196, 205),
            body: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    // Container(
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: const Icon(
                    //       Icons.favorite,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    //   alignment: Alignment.centerRight,
                    // ),
                    IconButton(
                      onPressed: () {},
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
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (Colors.black), width: 1),
                                  ),
                                  width: 50,
                                  child: Image.network(
                                      "https://filebroker-cdn.lazada.vn/kf/S644c06e189c74d02bc0ec840e9ed6e12d.jpg"),
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: const Text(
                                      "Son Kem lì black rouge air fit velvet lip tint Blackrouge A06 A12 ver8 [Sẵn  A01 - A45 ] | Shopee Việt NamSon Kem lì black rouge air",
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  )),
                                  width: 20,
                                  child: const Center(child: Text("1")),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
                    onPressed: () {},
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
