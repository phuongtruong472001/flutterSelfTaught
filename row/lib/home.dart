import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:row/call_api.dart';
import 'package:row/main_food.dart';

import 'Food.dart';

int selectedIndexBottomNavigationBar = 0;
int selectedIndexTabBar = 0;

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = false, checkBus = false, checkLock = false, checkPeople = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndexBottomNavigationBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bus_alert),
              title: Text("Bus"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock),
              title: Text("Security"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            )
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
        appBar: AppBar(
          title: Text(
            "Home",
          ),
        ),
        body: getBody());
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndexBottomNavigationBar = index;
    });
  }

  Widget getBody() {
    // if(selectedIndex == 0) {
    return MyHomePage();
    // }
    // else if(selectedIndex==1) {
    //   return this._myBus;
    // } else if(selectedIndex==2){
    //   return _myLock;
    // }
    // else {
    //   return _myProfile;
    // }
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final uri = "http://localhost:3000/Foods";
  final HttpService httpService = HttpService();
  var _foodsJson = [],_damJson=[],_beoJson=[],_xoJson=[],_vitaminJson=[];
  void fetchFoods() async {
    try {
      final respone = await http.get(Uri.parse(uri));
      final jsonData = jsonDecode(respone.body) as List;
      // for(var x in jsonData){
      //       var a=x["nutrition"];
      //       var b="chất đạm";
      //       var c="chất béo";
      //       var d="chất xơ";
            
      //       if(a==b)  _damJson.add(x);
      //       else if(a==c) _beoJson.add(x);
      //       else if(a==d) _xoJson.add(x);
      //       else {
      //         _vitaminJson.add(x);
      //         print("1");
      //       }

      //   }
      setState(() {
        _foodsJson = jsonData;
        
      });
      
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.menu),
                  )
                ],
              ),
            )),
      ),
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DefaultTabController(
            length: 5,
            child: Column(children: <Widget>[
              Expanded(
                flex: 1,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black26,
                  isScrollable: true,
                  onTap: (int index) {
                    onTapHandler(index);
                  },
                  tabs: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            border: Border.all(color: Colors.black26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        margin: const EdgeInsets.symmetric(vertical: 2.0),
                        width: 80,
                        child: Center(
                          child: Text(
                            "All",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      width: 80,
                      child: Center(
                        child: Text(
                          "Chất đạm",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      width: 80,
                      child: Center(
                        child: Text(
                          "Chất béo",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      width: 80,
                      child: Center(
                        child: Text(
                          "Vitamin-Chất khoáng",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      width: 80,
                      child: Center(
                        child: Text(
                          "Chất xơ",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: TabBarView(
                  children: [
                    Center(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _foodsJson.length,
                            itemBuilder: (context, index) {
                              var food = _foodsJson[index];
                              return OutlinedButton(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Image.network(food["img"])),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MainFood(
                                            food: food,
                                          )));
                                },
                              );
                            })),
                    
                    Center(
                      child: Text("abcxys"),
                      // child: ListView.builder(
                      //       scrollDirection: Axis.vertical,
                      //       itemCount: _damJson.length,
                      //       itemBuilder: (context, index) {
                      //         var food = _damJson[index];
                      //         return OutlinedButton(
                      //           child: Container(
                      //             margin: const EdgeInsets.symmetric(vertical: 6.0),
                      //             child: Image.network(food["img"])),
                      //           onPressed: () {
                      //             Navigator.of(context).push(MaterialPageRoute(
                      //                 builder: (context) => MainFood(
                      //                       food: food,
                      //                     )));
                      //           },
                      //         );
                      //       })
                    ),
                    Center(child: Text("Bike")),
                    Center(child: Text("Transit")),
                    Center(child: Text("Bike"))
                  ],
                ),
              )
            ]),
          ),
        ),
      )
    ]));
  }

  void onTapHandler(int index) {
    setState(() {
      fetchFoods();
      selectedIndexTabBar = index;
    });
  }
}
