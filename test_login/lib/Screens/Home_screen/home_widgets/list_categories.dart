import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/category.dart';

class ListCategories extends StatefulWidget {
  @override
  ListCategoriesPage createState() => ListCategoriesPage();
}

class ListCategoriesPage extends State<ListCategories> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Categories>(context).fetchCategories();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final listCategories = Provider.of<Categories>(context).categories;

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
                      child: Image.network(listCategories[index].imageLink),
                    ),
                  ),
                  Text(listCategories[index].name,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            );
          },
        ));
  }
}
