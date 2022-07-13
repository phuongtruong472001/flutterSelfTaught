import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/loaded.dart';

import '../../../Models/product.dart';
import '../../Products/detail_product.dart';


class RecommendForYou extends StatefulWidget {
  @override
  RecommendForYouPage createState() => RecommendForYouPage();
}

class RecommendForYouPage extends State<RecommendForYou> {

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    final startApp = Provider.of<StartApp>(context);
    
    if (startApp.isGetData == false) {
      data.fetchProduct();
      startApp.getDataComplete();
    }
    final listProducts= data.products;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 80,
            width: 80,
            child: GestureDetector(
              onTap: (() => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailProduct(product: listProducts[index],)))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(listProducts[index].imageLink),
                    ),
                  ),
                  Text(listProducts[index].name),
                  Text("\$ " + listProducts[index].price.toString())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
