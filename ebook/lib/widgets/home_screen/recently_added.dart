import 'package:ebook/providers/book.dart';
import 'package:ebook/providers/books.dart';
import 'package:ebook/screens/detail_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentlyAdded extends StatefulWidget{
  @override
  RecentlyAddedState createState()=>RecentlyAddedState();

}
class RecentlyAddedState extends State<RecentlyAdded> {
  @override
  void didChangeDependencies() {
    Provider.of<Books>(context).fetchAllBook();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context).books;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  DetailBook(books[index])));
          },
          child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Image.network(books[index].img)),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(
                                  books[index].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0)),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  books[index].author,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 18),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0)),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  books[index].description,
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
                          ),
                        )),
                  ],
                ),
              )),
        );
      },
      shrinkWrap: true,
    );
  }
}
