import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
class Food {
  
  final int id;
  final String foodName;
  final String img;
  final String material;
  final String recipes;
  final String nutrition;
  final String publicId;
  Food(this.id,this.foodName, this.img, this.material, this.recipes, this.nutrition, this.publicId);
  
}
List<Food> foods=[];
Future fetchAlbum() async {

  var response = await http
      .get(Uri.https('haui-hit-food.herokuapp.com','api/food'));
    var jsonData=jsonDecode(response.body);
    
    for (var a in jsonData){
      Food food = Food(a["id"],a["foodName"],a["img"],a["material"],a["recipes"],a["nutrition"],a["publicId"]);
      foods.add(food);
    }
    

  return foods;
}



//void main() => runApp(const MyApp());

class CallApi extends StatefulWidget {
  const CallApi({Key? key}) : super(key: key);

  @override
  _CallApiState createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.data!=null) {
                
                return  ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(foods[index].foodName),
                    );
                  
                });
              } else  if(snapshot.data==null){
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
             return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}