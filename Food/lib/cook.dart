import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

var link;
var recipes;

class Cook extends StatelessWidget {
  var food;

  Cook({Key key, this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    link = food["link"];
    recipes = food["recipes"];
    return MaterialApp(
      home: CookPage(),
    );
  }
}

class CookPage extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  @override
  _CookPageState createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  VideoPlayerController _controller;
  //String asset ="https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(link)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(children: <Widget>[
              Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: 36 / 24, // _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              Align(
                alignment: Alignment.center,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: Colors.black, backgroundColor: Colors.white),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    }),
              ),
            ]),
          ),
          Expanded(
              flex: 1,
              child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        var recipe = recipes[index];
                        return Container(
                          // decoration: BoxDecoration(
                          //     color: Colors.black12,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(5))),
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                            child: Text("Step ${index + 1} : $recipe",
                            
                            style: TextStyle(color: Colors.black,fontSize: 20,fontStyle:FontStyle.italic,decoration: TextDecoration.none),),
                          ),
                        );
                      })))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
