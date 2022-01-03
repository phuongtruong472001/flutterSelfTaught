import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  late int _selectedIndex;

  BottomNavigationBarWidget(this._selectedIndex,{Key? key}) : super(key: key);
  @override
  BottomNavigationBarWidgetPage createState() =>
      BottomNavigationBarWidgetPage();
}

class BottomNavigationBarWidgetPage extends State<BottomNavigationBarWidget> {
  
  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text("Home"),
          )
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        currentIndex: widget._selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
