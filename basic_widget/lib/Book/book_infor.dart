import 'package:flutter/material.dart';

import 'book.dart';

class BookInfor extends StatelessWidget {
  Book book;
  BookInfor(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            book.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 4.0)),
        Expanded(
          flex: 1,
          child: Text(
            book.author,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 18),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 4.0)),
        Expanded(
          flex: 3,
          child: Text(
            book.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              // fontFamily: "Poppins",

              fontSize: 17.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
