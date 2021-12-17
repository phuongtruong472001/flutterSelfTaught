import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter animation',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {  
  _HomePageState createState() => _HomePageState();  
}  
class _HomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {  
   Animation<double> animation;  
   AnimationController animationController;  
   
  @override  
  void initState() {  
    super.initState();  
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 10000));  
    CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);  
    animation.addListener((){  
      setState((){  
        print (animation.value.toString());  
      });  
    });  
    animation.addStatusListener((status){  
      if(status == AnimationStatus.completed){  
        animationController.reverse();  
      } else if(status == AnimationStatus.dismissed) {  
        animationController.forward();  
        }  
      });  
      animationController.forward();  
    }  
  @override  
  Widget build(BuildContext context) {  
    return Center(  
      child: AnimatedLogo(  
        animation: animation,  
      )  
    );  
  }  
}  
class AnimatedLogo extends AnimatedWidget {  
  final Tween<double> _sizeAnimation = Tween<double> (begin: 0.0, end: 10.0);  
  AnimatedLogo({Key key, Animation animation}):super(key: key, listenable: animation);  
  @override  
  Widget build(BuildContext context) {  
    final Animation<double> animation = listenable;  
    return Transform.scale(  
      scale: _sizeAnimation.evaluate(animation),  
      child: FlutterLogo(),  
    );  
  }  
} 