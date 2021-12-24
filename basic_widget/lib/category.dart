import 'package:basic_widget/Book/book.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget{
  List categories;
  Category(this.categories,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        
          Container(
            
            child: SingleChildScrollView (
              scrollDirection: Axis.horizontal,
              child: Row(
              // scrollDirection: Axis.horizontal,
              children: <Widget>[
                
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[0])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[1])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[2])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[3])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[2])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                              ),
                        child: Center(child: Text(categories[0])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 100,
                        decoration:
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightGreen,
                              ),
                        child: Center(child: Text(categories[0])),
                  ),
                ),
              ],
              
        ),
            ),
          );
  }
  
}