import 'package:flutter/material.dart';
import 'package:scaffold/Home/main_home.dart';
import 'package:scaffold/models/information.dart';
import 'package:badges/badges.dart';

class BodyWidget extends StatefulWidget {
  late int count;
  late InforClothes inforClothes;
  BodyWidget(this.count, this.inforClothes, {Key? key}) : super(key: key);
  @override
  BodyWidgetState createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  bool checkFavorite=false;
  List<String> listSize = ["S", "M", "L", "XL"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 7,
            child: Stack(children: <Widget>[
              Container(
                width: double.infinity,
                child: Image.asset(
                  widget.inforClothes.img,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon:checkFavorite? Icon(
                          Icons.favorite_border_outlined ,
                        ):Icon(Icons.favorite,color: Colors.red) ,
                        onPressed: () {
                            setState(() {
                              checkFavorite=!checkFavorite;
                            });
                        },
                      ),
                      Badge(
                          position: BadgePosition.topEnd(top: 5, end: 5),
                          badgeContent: Text(
                            widget.count.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          child: IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {}))
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ),
            ])),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 7,
                        child: Text(
                          widget.inforClothes.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 3,
                        child: Text(
                          widget.inforClothes.newPrice,
                          style: const TextStyle(color: Colors.orange),
                        ))
                  ],
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 7,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                             height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(Radius.circular(
                                        5.0) //                 <--- border radius here
                                    ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "3.0",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: const Text("6 Reviewer"),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: Text(widget.inforClothes.newPrice,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough)))
                  ],
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12)),
                child: TabBar(
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.orange,
                  controller: _tabController,
                  tabs: [
                    Text("Description"),
                    Text("More info"),
                    Text("Reviews")
                  ],
                ),
              ),
            )),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text(
                    "This article shows you 2 ways to display a badge on the top right (or any position you like) of a widget in Flutter. The first way is to write your own code and the second one is to use a third-party plugin.",
                    maxLines: 3,
                  ),
                  Text(
                    "This article shows you 2 ways to display a badge on the top right (or any position you like) of a widget in Flutter. The first way is to write your own code and the second one is to use a third-party plugin.",
                    maxLines: 3,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Stack(children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              child: new Text(
                                "3.0",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              top: 25.0,
                              left: 40.0,
                            ),
                            Positioned(
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              top: 25.0,
                              left: 70.0,
                            ),
                            Positioned(
                              child: new Text(
                                "6 reviews",
                                style: TextStyle(fontSize: 13),
                              ),
                              top: 50.0,
                              left: 45.0,
                            ),
                          ])),
                      Expanded(
                        flex: 6, 
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                          return Row(
                            children: <Widget>[
                              Text('${index+1}'),
                              Icon(Icons.star,size: 10,color: Colors.yellow,),
                              Container(
                                height: 10,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Colors.black38

                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 10,
                                    width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: Colors.green[300]

                                  ),),
                                )
                              )],
                          );
                        })
                        )
                    ],
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: Center(child: Text("Pincode"))),
                  Expanded(flex: 1, child: Center(child: Text("Check availability"))),
                  Expanded(flex: 1, child: Text("Delivery by . 25 June, Monday",maxLines: 2,))
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Colors",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child:
                    Text("Size", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listSize.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(listSize[index],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        );
                      })),
            )),
      ],
    );
  }
}
