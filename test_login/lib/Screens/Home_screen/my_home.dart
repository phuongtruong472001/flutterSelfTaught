import 'package:flutter/material.dart';
import 'package:test_login/Screens/Cart_screen/cart_screen.dart';
import 'package:test_login/Screens/Home_screen/home_widgets/recomment_for_you.dart';

import 'home_widgets/list_categories.dart';
import 'home_widgets/list_popular.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 50,
            child: Row(
              children: [
                const Expanded(flex: 9, child: Center(child: Text("DISCOVER"))),
                Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartSreen()));
                      },
                    ))
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.all(5),
              height: 50,
              child: const Center(
                child: Text(
                  "CATEGORIES",
                  textAlign: TextAlign.right,
                ),
              )),
          ListCategories(),
          Container(
              padding: EdgeInsets.all(5),
              height: 50,
              child: const Center(
                child: Text(
                  "RECOMMEND FOR YOU",
                  textAlign: TextAlign.right,
                ),
              )),
          RecommendForYou(),
          Container(
              padding: EdgeInsets.all(5),
              height: 50,
              child: const Center(
                child: Text(
                  "POPULAR PRODUCT",
                  textAlign: TextAlign.right,
                ),
              )),
          ListPopular(),
        ],
      ),
    );
  }
}
