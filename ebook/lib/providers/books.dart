import 'package:ebook/providers/book.dart';
import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Books with ChangeNotifier {
  final List<Book> _books = [];

  List<Book> get books {
    return [..._books];
  }

  Future<void> fetchAllBook() async {
    String url = "https://api-book-last-comment.herokuapp.com/api/books/";
    try {
      final respone = await http.get(Uri.parse(url));
      List<dynamic> extractedData = convert.jsonDecode(respone.body);
      for (var element in extractedData) {
        _books.add(Book.fromJson(element));
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
