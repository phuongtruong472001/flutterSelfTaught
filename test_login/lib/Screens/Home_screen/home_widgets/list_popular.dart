import 'package:flutter/material.dart';
import 'package:test_login/Models/product.dart';

import '../../Products/detail_product.dart';

class ListPopular extends StatelessWidget {
  List<Product> listProducts;

  ListPopular({Key? key, required this.listProducts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (listProducts.length + 1) * 200 / 2,
      child: GridView.builder(
        //scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black12)),
            height: 120,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduct(
                                    product: listProducts[index],
                                  )));
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Hero(
                          tag: listProducts[index],
                          child: Image.network(
                            listProducts[index].imageLink,
                          )),
                    ),
                  ),
                ),
                Text(
                  listProducts[index].name,
                ),
                Text("\$ ${listProducts[index].price}"),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 10,
                        color: Colors.orange,
                      ),
                      Text(
                        listProducts[index].sold.toString(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.remove_red_eye,
                          size: 10, color: Colors.orange),
                      Text(
                        listProducts[index].viewed.toString(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 3.0, mainAxisSpacing: 3.0),
      ),
    );
  }
}
