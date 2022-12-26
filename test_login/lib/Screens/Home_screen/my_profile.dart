// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/Screens/Home_screen/home_widgets/list_favorie.dart';
import 'package:test_login/Screens/Login/login_screen.dart';
import 'package:test_login/Screens/YourOrders/your_orders.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyProfile extends StatefulWidget {
  @override
  MyProfilePage createState() => MyProfilePage();
}

class MyProfilePage extends State<MyProfile> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = box.read("username")??"";
    int optionLogin = box.read("status");
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: (Colors.black), width: 1),
                  color: const Color.fromARGB(255, 171, 186, 144),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Emblem-person-blue.svg/2048px-Emblem-person-blue.svg.png"),
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: (Colors.black), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(children: const [
                          Text(
                            "Oders",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          )
                        ])),
                    Expanded(
                      flex: 1,
                      child: Column(children: const [
                        Text(
                          "Proccessing",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "14",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )
                      ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(children: const [
                        Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: (Colors.black), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                // height: 100,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListFavorite(listFavorite: [],)));
                          },
                          child: const ListTile(
                              leading: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              title: Text('Favorites'),
                              trailing: Icon(
                                Icons.more_vert,
                              )),
                        ),
                      ),
                      Card(
                        child: GestureDetector(
                          onTap: () {},
                          child: const ListTile(
                            leading: Icon(Icons.person),
                            title: Text('My Profile'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                      Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YourOrders()));
                          },
                          child: const ListTile(
                            leading: Icon(
                              Icons.shopping_cart,
                              color: Colors.blue,
                            ),
                            title: Text('Your orders'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: (Colors.black), width: 1),
                    borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    EasyLoading.show(status: "Đang đăng xuất ");
                    if (optionLogin == 1) {
                      FacebookAuth.instance.logOut().then((value) {
                        box.remove("username");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });
                    } else if (optionLogin == 2) {
                      _googleSignIn.disconnect();

                      box.remove("username");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else if (optionLogin == 0) {
                      box.remove("username");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                    print(box.read("username"));
                    EasyLoading.dismiss();
                  },
                  child: const Text(
                    "LOG OUT",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
