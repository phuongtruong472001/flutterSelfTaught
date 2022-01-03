import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget{
  late int count;
  BottomNavigationBarWidget(this.count,{Key? key}) : super(key: key);
  @override
  BottomNavigationBarWidgetPage createState()=>BottomNavigationBarWidgetPage();

}

class BottomNavigationBarWidgetPage extends State<BottomNavigationBarWidget>{

  void _incrementCounter() {
      setState(() {
        widget.count++;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: TextButton(
                  child: Text("Add to Cart"),
                  onPressed: () {
                    _incrementCounter();
                    print(widget.count);
                  },
                ),
                title: Text("Add to card")),
            BottomNavigationBarItem(
                icon: TextButton(
                  child: Text("Buy now"),
                  onPressed: () {},
                ),
                title: Text("Buy now"))
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),);
  }

}