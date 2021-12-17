import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:row/home.dart';
import 'package:video_player/video_player.dart';

import 'asset_player_widget.dart';
import 'cook.dart';

class MainFood extends StatelessWidget {
  
  var  food;

  MainFood({Key key, this.food}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _material=food["material"];
      return Scaffold(appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(food["foodName"], style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
          color: Colors.black,
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Facebook"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Instagram"),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.network(food["img"])
          
          
            ),
            Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Ingridients'),
                      flex: 1,
                    ),
                    Expanded(
                      child: TextButton(
                        child: Text("More"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green, // background
                          onPrimary: Colors.white,
                          // foreground
                        ),
                        onPressed: () {},
                      ),
                      flex: 1,
                    ),
                  ],
                )),
            Expanded(
                flex: 4,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _material.length,
                  itemBuilder: (context,index)
                  {
                    var  material=_material[index];
                    var name=material["name"];
                    var count=material["count"];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                        child: Row(
                          children: <Widget>[
                            
                              Expanded(
                                child: Text(name),
                                flex: 2,
                              ),
                        
                            Expanded(
                              child: Text(count),
                              flex: 1,
                            ),
                          ]),
                      ));
                  }
                  
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Cook(
                                            food: food,
                                          )));
                    },
                    child: Text("Start cook !", style: TextStyle(fontSize: 20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}



