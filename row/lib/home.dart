import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int selectedIndexBottomNavigationBar = 0;
int selectedIndexTabBar=0;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      width: 80,
                      child: Center(
                        child: Text(
                          "All",
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
                          "All",
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
                          "All",
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
                          "All",
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
                          "All",
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
                    Container(
                        child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        OutlinedButton(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/buffet.png"),
                                    fit: BoxFit.cover)),
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 300,
                            child: Row(
                              children: <Widget>[],
                            ),
                          ),
                          onPressed: () {},
                        ),
                        OutlinedButton(
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/buffet.png"),
                                      fit: BoxFit.cover)),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              height: 300),
                          onPressed: () {},
                        ),
                        OutlinedButton(
                          child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/buffet.png"),
                                      fit: BoxFit.cover)),
                              margin:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              height: 300),
                          onPressed: () {},
                        )
                      ],
                    )),
                    Center(child: Text("Transit")),
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
      selectedIndexTabBar = index;
    });
  }
}
