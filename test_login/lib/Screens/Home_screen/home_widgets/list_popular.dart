import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/product.dart';

import '../../../loaded.dart';
import '../../Products/detail_product.dart';

class ListPopular extends StatefulWidget {
  @override
  ListPopularPage createState() => ListPopularPage();
}

class ListPopularPage extends State<ListPopular> {

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
      height: 800,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
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
                          child: Image.network(listProducts[index].imageLink)),
                    ),
                  ),
                ),
                Text(listProducts[index].name),
                Text("\$ " + listProducts[index].price.toString()),
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
