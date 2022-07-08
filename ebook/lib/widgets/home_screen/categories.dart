import 'package:flutter/material.dart';

class Categories extends StatelessWidget{
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context,index){
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lightGreen,
            ),
            child: Center(child: Text("short stories")),
          ),
      );
    });
  }

}