import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayScreen extends StatefulWidget {
  @override
  PayScreenPage createState() => PayScreenPage();
}

class PayScreenPage extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Center(
                        child: Text(
                          "Confirm Bill",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 195, 207, 213))),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              "Delivery Address",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Change",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text("Home"),
                    SizedBox(
                      child: Column(
                        children: const [
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.orange),
                            title: Text("Truong Phuong"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.orange),
                            title: Text(
                              "Truong Phuong",
                            ),
                            trailing: Icon(Icons.navigate_next_outlined),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.orange,
                            ),
                            title: Text("Truong Phuong"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 195, 207, 213))),
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Bill",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 4,
                            child: Text(
                              "Product",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("3 items",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
                          const Expanded(
                              flex: 1, child: Icon(Icons.navigate_next_rounded))
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
                              "Price",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("\$72",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
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
                              "Shipping Fee",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("\$72",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
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
                              "Have a promo code?",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text("Change",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
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
                              child: const Text("\$74",
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
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: CupertinoButton(
                      color: const Color.fromARGB(255, 224, 140, 80),
                      disabledColor: const Color.fromARGB(255, 214, 155, 53),
                      borderRadius: BorderRadius.circular(30),
                      onPressed: () {},
                      child: const Text(
                        "Complete",
                        style: TextStyle(
                            fontSize: 15,
                            //color: Colors.black,
                            decoration: TextDecoration.none),
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}
