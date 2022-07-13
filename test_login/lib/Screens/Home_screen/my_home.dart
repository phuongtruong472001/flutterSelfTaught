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
        crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: const EdgeInsets.all(10),
              height: 50,
              child: const Text(
                "CATEGORIES",
                textAlign: TextAlign.left,
              )),
          ListCategories(),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              child: const Text(
                "RECOMMEND FOR YOU",
                textAlign: TextAlign.right,
              )),
          RecommendForYou(),
          Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              child: const Text(
                "POPULAR PRODUCT",
                textAlign: TextAlign.right,
              )),
          ListPopular(),
        ],
      ),
    );
  }
}
