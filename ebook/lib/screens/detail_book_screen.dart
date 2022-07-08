import 'package:ebook/providers/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class DetailBook extends StatefulWidget {
  final Book book;

  const DetailBook(this.book, {Key? key}) : super(key: key);
  @override
  DetailBookState createState() => DetailBookState();
}

class DetailBookState extends State<DetailBook> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.book.name,
      home: Scaffold(
        appBar: AppBar(
            title: Text(widget.book.name),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: widget.book.checkFavorite
                    ? Icon(Icons.favorite, color: Colors.red)
                    : Icon(Icons.favorite_border),
                tooltip: 'Favorite',
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Favorite')));
                      setState(() {
                    widget.book.checkFavorite = !widget.book.checkFavorite;
                  });
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.network(
                              widget.book.img,
                              fit: BoxFit.fill,
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text(
                                  widget.book.name,
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
                                  widget.book.author,
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
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
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
                                                    BorderRadius.circular(10)),
                                            // primary: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: OutlinedButton(
                                            child: Text(
                                              "Literary",
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
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      onPressed: () {},
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
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
              Container(
                  height: 50,
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Book Description",
                    ),
                  )),
              SingleChildScrollView(
                  child: Container(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.book.description,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
