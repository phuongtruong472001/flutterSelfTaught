import 'package:basic_widget/Book/book.dart';
import 'package:flutter/material.dart';

class BookIntro extends StatelessWidget {
  List<Book> books;
  BookIntro(this.books, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        Book book = books[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(book.img)),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
