// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'book.dart';


class BookDetail extends StatelessWidget {
  late Book book;

  BookDetail(this.book, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _checkFavorite = false;
    return MaterialApp(
      title: book.name,
      home: Scaffold(
        appBar: AppBar(
            title: Text(book.name),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.favorite),
                tooltip: 'Show Snackbar',
                //color: _checkFavorite ? Colors.red :Colors.black12,

                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Favorite')));
                  _checkFavorite = !_checkFavorite;
                  color:
                  _checkFavorite ? Colors.red : Colors.black12;
                },
              ),
              IconButton(
                icon: const Icon(Icons.file_upload_outlined),
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Upload')));
                },
              ),
            ]),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Image.network(book.img)),
                          Expanded(
                              flex: 3,
                              child: Column(children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    book.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ),
                                // const Padding(
                                //     padding: EdgeInsets.only(bottom: 4.0)),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    book.author,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 18),
                                  ),
                                ),
                                
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: OutlinedButton(
                                            child: Text(
                                              "Fiction",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              // primary: Colors.white,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                            child: OutlinedButton(
                                              child: Text(
                                                "Literary",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                // primary: Colors.white,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // const Padding(
                                //     padding: EdgeInsets.only(bottom: 4.0)),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.blue),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.download,
                                                color: Colors.white,
                                              ),
                                              // SizedBox(width: 3),
                                              Text("Download Epub",
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ]))
                        ],
                      ),
                    )),
              ),
              Expanded(
                  flex: 1,
                  child:  Text(
                    "Book Description",
                    
                  )),
              Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(book.description,style: const TextStyle(fontSize: 15),),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
