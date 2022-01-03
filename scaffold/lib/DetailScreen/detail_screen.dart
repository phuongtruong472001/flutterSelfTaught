// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scaffold/DetailScreen/body_detail_screen.dart';
import 'package:scaffold/DetailScreen/bottom_navigation_bar.dart';
import 'package:scaffold/models/information.dart';

class DetailScreen extends StatefulWidget {
  late InforClothes inforClothes;
  DetailScreen(this.inforClothes, {Key? key}) : super(key: key);
  @override
  DetailScreenPage createState() => DetailScreenPage();
}

class DetailScreenPage extends State<DetailScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: TextButton(
                      child: Center(
                          child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.black),
                      )),
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      child: TextButton(
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                        )),
                        onPressed: () {},
                      ),
                    )),
              ],
            ),
          ),
          backgroundColor: Colors.grey[200],
          body: BodyWidget(count, widget.inforClothes)),
    );
  }
}
