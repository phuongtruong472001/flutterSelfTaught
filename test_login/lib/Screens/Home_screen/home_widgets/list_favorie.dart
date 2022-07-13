import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/product.dart';

import '../../Products/detail_product.dart';

class ListFavorite extends StatefulWidget {
  @override
  ListFavoritePage createState() => ListFavoritePage();
}

class ListFavoritePage extends State<ListFavorite> {
  @override
  Widget build(BuildContext context) {
    final listFavorite = Provider.of<ListFavorites>(context).products;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorie")),
      body: SizedBox(
        height: 800,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listFavorite.length,
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
                                      product: listFavorite[index],
                                    )));
                      },
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Hero(tag :listFavorite[index],child: Image.network(listFavorite[index].imageLink)),
                      ),
                    ),
                  ),
                  Text(listFavorite[index].name),
                  Text("\$ " + listFavorite[index].price.toString()),
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
                          listFavorite[index].sold.toString(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.remove_red_eye,
                            size: 10, color: Colors.orange),
                        Text(
                          listFavorite[index].viewed.toString(),
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
      ),
    );
  }
}
