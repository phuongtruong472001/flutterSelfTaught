import 'package:flutter/material.dart';
import 'package:row/home.dart';

class Welcome extends StatelessWidget {
  var userName;
 Welcome({Key key,this.userName}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName.toString()),
             accountEmail: Text(userName.toString()),
             currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/hello.png"),),
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
        ],),
      ),
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/buffet.png"), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: OutlineButton(
            child: Text(
              "Start",
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.white,
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
      ),
    );
  }
}
