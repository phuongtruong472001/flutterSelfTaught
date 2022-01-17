
import 'package:basic_widget/Book/book.dart';
import 'package:flutter/cupertino.dart';

class Books with ChangeNotifier{
  List<Book> _books=[];

  List<Book> get books{
    return [..._books];
  }
}