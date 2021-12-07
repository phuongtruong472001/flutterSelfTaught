import 'package:flutter/material.dart';
import 'package:row/home.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcome our app !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/buffet.png"), context);
    return Scaffold(
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
