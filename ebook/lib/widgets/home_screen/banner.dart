
import 'package:ebook/providers/books.dart';
import 'package:ebook/screens/detail_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Banners extends StatefulWidget{
  const Banners({Key? key}) : super(key: key);

  @override
  BannersState createState()=>BannersState();
}

class BannersState extends State<Banners>{
  @override
  void didChangeDependencies() {
    Provider.of<Books>(context).fetchAllBook();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final books=Provider.of<Books> (context).books;
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailBook(books[index])));
               },
              child: Image.network(books[index].img))),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

}