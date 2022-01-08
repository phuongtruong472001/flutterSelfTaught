import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/cart.dart';
import 'package:provider_state_management/Providers/drinks.dart';
import 'package:provider_state_management/Providers/orders.dart';

import 'HomeScreen/main_home_screen.dart';
import 'Providers/drink.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Drinks()),
        ChangeNotifierProvider.value(value: Cart()),
        //ChangeNotifierProvider.value(value: Orders()),
        
      ],
      child: MaterialApp(
        title: "My shop",
        home: MainHome(),
      ),
    );
  }
}
