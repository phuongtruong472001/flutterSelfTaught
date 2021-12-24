
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_widget/home_widget.dart';

class Home extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

   
  @override
    _HomePageState createState()=>_HomePageState();
   

}

class _HomePageState extends State<HomePage>{
  int _selectedIndex =0;
  static const List<Widget> _widgetOptions = <Widget>[  
    HomeWidget(), 
    Text('Explore', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Setting', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
  ];  
  
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Truong Phuong"),),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

}