import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/BloC/cart_bloc.dart';
import 'package:my_app/HomeScreen/main_cart_screen.dart';
// import 'package:my_app/Widgets/badge.dart';
import 'package:my_app/Widgets/drink_grid.dart';
import 'package:badges/badges.dart';
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
        
        Badge(
              position: BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: Text(
                '',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              child:
                  IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<ShopBloc>(context),
                            child: CartScreen())));
                  })),
        
        
      ]),
      body: Container(padding: const EdgeInsets.all(10.0), child: DrinkGrid()),
    );
  }
}
