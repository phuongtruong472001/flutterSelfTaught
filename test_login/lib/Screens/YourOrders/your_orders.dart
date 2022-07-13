import 'package:flutter/material.dart';
import 'package:test_login/Screens/YourOrders/Widgets/unpaid.dart';

class YourOrders extends StatefulWidget {
  @override
  YourOrdersPage createState() => YourOrdersPage();
}

class YourOrdersPage extends State<YourOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                            "My Order",
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
                const SizedBox(
                  height: 40,
                  child: TabBar(isScrollable: true, tabs: [
                    Text(
                      "Unpaid",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text("Unpaid", style: TextStyle(color: Colors.black)),
                    Text("Unpaid", style: TextStyle(color: Colors.black))
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: TabBarView(
                      children: [Unpaid(), const Text("2"), const Text("3")]),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
