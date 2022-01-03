import 'package:flutter/material.dart';
import 'package:scaffold/Home/drawer.dart';
import 'package:scaffold/Home/body_home_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _selectedIndex=0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text("2"),
    Text("3"),
    Text("4")
  ];
  void _onItemTapped(int index) {
    setState(() {
     _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ], title: Text("Home")),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex:_selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(elevation: 100, child: DrawerWidget()),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
