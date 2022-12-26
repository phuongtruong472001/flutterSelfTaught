import 'package:flutter/material.dart';

import '../../../Models/product.dart';

class ListCategories extends StatelessWidget {
  List<Product> listCategories;

  ListCategories({Key? key, required this.listCategories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 80,
            width: 80,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(listCategories[index].imageLink ,),
                  ),
                ),
                Text(listCategories[index].name ,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          );
        },
      ),
    );
  }
}
