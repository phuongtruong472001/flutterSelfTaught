import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'chewie_list_item.dart';

class MainFood extends StatelessWidget {
  const MainFood({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainFoodPage(),
    );
  }
}

class MainFoodPage extends StatefulWidget {
  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  late VideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Salmon Sushi", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
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
              child: ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                  'https://www.youtube.com/watch?v=r57VfwRdxFA',
                ),
                looping: true,
                
              ),
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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.rice_bowl),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text("Rice Bowl"),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("1000g"),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.rice_bowl),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text("Rice Bowl"),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("1000g"),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.rice_bowl),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text("Rice Bowl"),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("1000g"),
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: 60,
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(Icons.rice_bowl),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text("Rice Bowl"),
                            flex: 2,
                          ),
                          Expanded(
                            child: Text("1000g"),
                            flex: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    onPressed: () {},
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


