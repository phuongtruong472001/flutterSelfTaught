// ignore_for_file: prefer_const_constructors

import 'package:basic_widget/Book/book.dart';
import 'package:basic_widget/Home_Widget/book_intro.dart';
import 'package:basic_widget/Home_Widget/new_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category.dart';

class HomeWidget extends StatelessWidget {
  
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> books=[];
    
    List categories=["Chất đạm","chất Khoáng","chất béo","chất bột đường","vitamin-chất khoáng"];
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: BookIntro(books)),
        Expanded(
          flex:1,
          child: Category(categories)),
        Expanded(
          flex:5,
          child: NewBook(books))
      ],
    );
  }
}
