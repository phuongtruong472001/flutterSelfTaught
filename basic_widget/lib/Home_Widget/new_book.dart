import 'package:basic_widget/Book/book.dart';
import 'package:basic_widget/Book/book_detail.dart';
import 'package:basic_widget/Book/book_infor.dart';
import 'package:flutter/material.dart';

class NewBook extends StatelessWidget {
  List<Book> books; //= Book("sknnckan", "sbajasnm", "bsanmcm", "cbnmcm");
  NewBook(this.books, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        Book book = books[index];
        return TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookDetail(book)));
          },
          child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Image.network(book.img)),
                     Expanded(flex: 3, child: Padding(
                       padding: const EdgeInsets.only(left: 10),
                       child: BookInfor(book),
                     )),
                  ],
                ),
              )),
        );
      },
      scrollDirection: Axis.vertical,
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
