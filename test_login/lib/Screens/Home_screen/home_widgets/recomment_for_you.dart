import 'package:flutter/material.dart';

import '../../../Models/product.dart';
import '../../Products/detail_product.dart';

class RecommendForYou extends StatelessWidget {
  List<Product> listProducts;

  RecommendForYou({Key? key, required this.listProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProduct(
                            product: listProducts[index],
                          )))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        listProducts[index].imageLink,
                      ),
                    ),
                  ),
                  Text(
                    listProducts[index].name,
                  ),
                  Text("\$ ${listProducts[index].price}")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
