import 'package:flutter/material.dart';

class Home extends StatelessWidget{
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
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Scaffold Example Of  Truong Phuong")),
      body: Center(child: Text(_count.toString())),
      bottomNavigationBar:BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 40,),) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          setState(() {
            _count++;
          });
         },
        child: Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        drawer: Drawer(
          elevation: 100,
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Truong Phuong"), 
                accountEmail: Text("phuongtruong472001@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://res.cloudinary.com/dzsi7dmey/image/upload/v1624055714/ampdrzexlkdcpaufziig.png"),
                ),
                ),
                ListTile(
                  title: new Text("Inbox"),
                  leading: new Icon(Icons.mail),
                ),
                ListTile(  
              title: new Text("Primary"),  
              leading: new Icon(Icons.inbox),  
            ),  
            ListTile(  
              title: new Text("Social"),  
              leading: new Icon(Icons.people),  
            ),  
            ListTile(  
              title: new Text("Promotions"),  
              leading: new Icon(Icons.local_offer),
            )  
            ],
          ),),
    );
  }
}
