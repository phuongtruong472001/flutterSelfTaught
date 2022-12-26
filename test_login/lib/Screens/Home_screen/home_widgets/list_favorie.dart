import 'package:flutter/material.dart';
import 'package:test_login/Models/product.dart';

import '../../Products/detail_product.dart';

class ListFavorite extends StatelessWidget {
  List<Product> listFavorite;

  ListFavorite({required this.listFavorite, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Favorie")),
      body: SizedBox(
        height: 800,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listFavorite.length,
          physics: const NeverScrollableScrollPhysics(),
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
                        child: Hero(
                            tag: listFavorite[index],
                            child: Image.network(
                              listFavorite[index].imageLink,
                            )),
                      ),
                    ),
                  ),
                  Text(
                    listFavorite[index].name,
                  ),
                  Text("\$ ${listFavorite[index].price}"),
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
