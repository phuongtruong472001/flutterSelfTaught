import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:row/Food.dart';



class HttpService{
  final String foodsUrl="https://haui-hit-food.herokuapp.com/api/food";
  
    Future<List<Food>> getFoods() async{
      Response res = await get(Uri.parse(foodsUrl));

      if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Food> foods = body
        .map(
          (dynamic item) => Food.fromJson(item),
        )
        .toList();

        return foods;
      }
      else{
        throw "can't get api";
      }
    }
}



// class CallApi extends StatefulWidget {
//   const CallApi({Key key}) : super(key: key);

//   @override
//   _CallApiState createState() => _CallApiState();
// }

// class _CallApiState extends State<CallApi> {
//   final uri="http://localhost:3000/Foods" ;
//   var _foodsJson=[];
//   void fetchFoods() async {
    
//     try{
//       final respone=await http.get(Uri.parse(uri));
//       final jsonData=jsonDecode(respone.body) as List;
//       setState(() {
//         _foodsJson=jsonData;
//     });
//     }catch(err){}

  
//     }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchFoods();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: 
//                   ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context,index){
//                     var food =_foodsJson[index];
//                         return  Image.network(food["img"]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }