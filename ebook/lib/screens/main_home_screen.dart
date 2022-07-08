import 'package:ebook/widgets/home_screen/categories.dart';
import 'package:ebook/widgets/home_screen/recently_added.dart';
import 'package:flutter/material.dart';
import '../widgets/home_screen/banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children:   <Widget>[
          SizedBox(
            height: 150,
            child: Banners(),
          ),
          SizedBox(
            height: 30,
            child: Text("Categories"),
          ),
          SizedBox(
            height: 50,
            child: Categories(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10,top: 10),
            child: SizedBox(
              height: 30,
              child: Text("Recently Added"),
            ),
          ),
          SizedBox(
            height: 1000,
            child: RecentlyAdded(),
          ),
        ],
      ),
    );
  }
}
