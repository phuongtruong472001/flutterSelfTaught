import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:scaffold/DetailScreen/detail_screen.dart';
import 'package:scaffold/models/information.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 200,
        child: Carousel(
          images: [
            Image(image: AssetImage("products/banners/b1.jpg"),fit: BoxFit.fill,),
            Image(image: AssetImage("products/banners/b2.jpg"),fit: BoxFit.fill),
            Image(image: AssetImage("products/banners/b3.jpg"),fit: BoxFit.fill),
            Image(image: AssetImage("products/banners/b4.jpg"),fit: BoxFit.fill),
            Image(image: AssetImage("products/banners/b5.jpg"),fit: BoxFit.fill),
            Image(image: AssetImage("products/banners/b6.jpg"),fit: BoxFit.fill),
          ],
          autoplay: true,
          animationDuration: const Duration(milliseconds: 100),
          dotSize: 6.0,
          dotSpacing: 10.0,
          dotColor: Colors.lightGreenAccent,
          borderRadius: true,
        ),
      ),
      Container(
        height: 70,
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: new BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                        child: SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: Image.asset("icons/ic_men.png")),
                      )),
                  Expanded(flex: 1, child: Text("Men",style: TextStyle(color: Colors.red),)),
                ])),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: new BoxDecoration(
                                    color: Colors.green[200],
                                    shape: BoxShape.circle,
                                  ),
                        child: SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: Image.asset("icons/ic_woman.png",)),
                      )),
                  Expanded(flex: 1, child: Text("Woman",style: TextStyle(color: Colors.green[200]))),
                ])),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: new BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.circle,
                                  ),
                        child: SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: Image.asset("icons/ic_kids.png")),
                      )),
                  Expanded(flex: 1, child: Text("Baby & Kids",style: TextStyle(color: Colors.yellow))),
                ])),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: new BoxDecoration(
                                    color: Colors.blue[900],
                                    shape: BoxShape.circle,
                                  ),
                        child: SizedBox(
                            height: 30.0,
                            width: 30.0,
                            child: Image.asset("icons/ic_bag.png")),
                      )),
                  Expanded(flex: 1, child: Text("Bags",style: TextStyle(color: Colors.blue[900]),)),
                ])),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: new BoxDecoration(
                                    color: Colors.green[900],
                                    shape: BoxShape.circle,
                                  ),
                        child: SizedBox(
                           height: 30.0,
                            width: 30.0,
                            child: Image.asset("icons/ic_decor.png")),
                      )),
                  Expanded(flex: 1, child: Text("Decor",style: TextStyle(color: Colors.green[900]),)),
                ])),
          ),
        ]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    child: Text(
                      "Newest Arrivals",
                      style: TextStyle(fontSize: 15),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Container(
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listNewest.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(listNewest[index])));
                  },
                  child: Container(
                    width: 160,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Image.asset(listNewest[index].img)),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Text(listNewest[index].name)),
                                Expanded(
                                    flex: 1,
                                    child: Center(child: Text(listNewest[index].oldPrice,style: TextStyle(decoration: TextDecoration.lineThrough)))),
                                Expanded(
                                    flex: 1,
                                    child: Text(listNewest[index].newPrice,style: TextStyle(color: Colors.orange),)),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    child: Text(
                      "Featured Products",
                      style: TextStyle(fontSize: 15),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Container(
                    child: Text(
                      "View all",
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listFeatrured.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(listFeatrured[index])));
                  },
                  child: Container(
                    width: 160,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            flex: 4,
                            child: Image.asset(listFeatrured[index].img)),
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Text(listFeatrured[index].name)),
                                Expanded(
                                    flex: 1,
                                    child: Center(child: Text(listFeatrured[index].oldPrice,style: TextStyle(decoration: TextDecoration.lineThrough)))),
                                Expanded(
                                    flex: 1,
                                    child: Text(listFeatrured[index].newPrice,style: TextStyle(color: Colors.orange))),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    ]);
  }
}
