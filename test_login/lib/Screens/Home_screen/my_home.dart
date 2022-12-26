import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/Screens/Home_screen/bloc/home_bloc.dart';
import 'package:test_login/Screens/Home_screen/home_widgets/recomment_for_you.dart';

import '../Cart_screen/badge.dart';
import '../Cart_screen/bloc/cart_bloc.dart';
import '../Cart_screen/cart_screen.dart';
import 'home_widgets/list_categories.dart';
import 'home_widgets/list_popular.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Container(
                color: Colors.grey,
                height: 50,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 9, child: Center(child: Text("DISCOVER"))),
                    Expanded(
                      flex: 1,
                      child: Badge(
                        value: state is CartLoaded?"${state.cart.products.length}":"0",
                        child: IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state is HomeLoading) ...{
                    const CircularProgressIndicator(),
                  } else if (state is HomeLoaded) ...{
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        child: const Text(
                          "CATEGORIES",
                          textAlign: TextAlign.left,
                        )),
                    ListCategories(
                      listCategories: state.products,
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        child: const Text(
                          "RECOMMEND FOR YOU",
                          textAlign: TextAlign.right,
                        )),
                    RecommendForYou(listProducts: state.products),
                    Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        child: const Text(
                          "POPULAR PRODUCT",
                          textAlign: TextAlign.right,
                        )),
                    ListPopular(listProducts: state.products),
                  } else
                    ...{}
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
