import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: (Colors.black), width: 1),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: Center(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(children: [Text("Oders"), Text("2")])),
                  Expanded(
                    flex: 1,
                    child: Column(children: [Text("Proccessing"), Text("5")]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(children: [Text("Completed"), Text("2")]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(children: [Text("Favorite"), Text("2")]),
                  )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: (Colors.black), width: 1),
                borderRadius: BorderRadius.circular(20)),
            height: 100,
            child: Column(
              children: [
                TextButton(onPressed: () {}, child: const Text("My Profile")),
                TextButton(onPressed: () {}, child: const Text("My Orders")),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: (Colors.black), width: 1),
                borderRadius: BorderRadius.circular(20)),
            height: 100,
            child: Column(
              children: [
                TextButton(onPressed: () {}, child: const Text("LOG OUT",style:TextStyle(color: Colors.red))),
               
              ],
            ),
          )
        ],
      ),
    );
  }
}
