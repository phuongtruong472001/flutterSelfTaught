import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({Key? key}) : super(key: key);
  // This will contain the URL/asset path which we want to play
  @override
  __AssetPlayerWidgetState createState() => __AssetPlayerWidgetState();
}

class __AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  late VideoPlayerController _controller;
  final asset = 'assets/music.mp4';
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(asset)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Stack(children: <Widget>[
         Container(
           
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio:36/24,// _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
        
        Align(
          alignment: Alignment.center,
          child: OutlineButton(
                
                  textColor: Colors.black,
                  
                  color: Colors.white,
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color:Colors.white,
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
