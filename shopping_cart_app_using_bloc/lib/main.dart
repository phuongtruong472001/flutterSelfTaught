import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/Screens/product_page.dart';
import 'package:shop_cart/shop/bloc/shop_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: ProductPage(),
      ),
    );
  }
}
