import 'package:flutter/material.dart';

class DetailOrder extends StatelessWidget {
  final itemBills;
  int Total;
  DetailOrder({required this.itemBills, required this.Total});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 223, 196, 205),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                    itemCount: itemBills.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                child: Image.network(
                                    "https://vn-test-11.slatic.net/p/58cd7c7a49733ac8a64542879bbc025b.jpg_1500x1500q80.jpg"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        itemBills[index]["name"],
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                  Text("x " +
                                      itemBills[index]["quantity"].toString())
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text((itemBills[index]["quantity"] *
                                        itemBills[index]["price"])
                                    .toString()),
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
                          child: Text(Total.toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ))));
  }
}
