import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/HomeScreen/main_cart_screen.dart';
import 'package:provider_state_management/Providers/cart.dart';
import 'package:provider_state_management/Providers/drink.dart';
import 'package:provider_state_management/Widgets/badge.dart';

import 'package:provider_state_management/Widgets/drink_grid.dart';
import 'package:provider_state_management/Widgets/item_drink_ui.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  @override
  MainHomeScreenState createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Truong Phuong"), actions: <Widget>[
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: IconButton(
                  icon: const Icon(Icons.shopping_cart), onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                  })),
        )
      ]),
      body: Container(padding: const EdgeInsets.all(10.0), child: DrinkGrid()),
    );
  }
}
