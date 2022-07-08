import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/Screens/Home_screen/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenPage createState() => LoginScreenPage();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginScreenPage extends State<LoginScreen> {
  GoogleSignInAccount? _currentUser;
  late SharedPreferences prefs;
  Map? userData;
  Future<void> signInWithGG() async {
    try {
      print('hi');

      await _googleSignIn.signOut();

      await _googleSignIn.signIn();
      prefs = await SharedPreferences.getInstance();
      print('h2');
      await prefs.setString('username', _currentUser?.displayName ?? "");
      await prefs.setInt('status', 2);
      print(prefs.getString("username"));
      if (prefs.getString("username") != "") {
        print('không vào đây à');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print(e);
      EasyLoading.showError("Có lỗi xảy ra");
    }
  }

  Future<void> signInWithFB() async {
    try {
      EasyLoading.show(status: "Đang đăng nhập,vui lòng đợi ");
      final result =
          await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
      if (result.status == LoginStatus.success) {
        final requestData =
            await FacebookAuth.i.getUserData(fields: "email,name");
        userData = requestData;
        prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', userData!["name"]);
        print(prefs.getString("username"));
        await prefs.setInt('status', 1);
        EasyLoading.dismiss();
        if (prefs.getString("username") != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      }
    } catch (e) {
      EasyLoading.showError("Có lỗi xảy ra");
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentUser = _googleSignIn.currentUser;
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    bool checkRemmember = false;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {},
                        ),
                      ),
                      const Expanded(
                          flex: 8,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                child: Center(
                    child: Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 25),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                child: Center(
                    child: Center(
                  child: Text(
                    "Sign in with your email and password ",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 10),
                  ),
                )),
              ),
              const SizedBox(
                child: Center(
                    child: Center(
                  child: Text(
                    " or continue with social media",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 10),
                  ),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const <Widget>[
                      // Checkbox(
                      //   value: checkRemmember,
                      //   onChanged: (bool value) => setState(() {
                      //       checkRemmember = value;
                      //     }),,
                      // ),
                      Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              "Remmember me",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: CupertinoButton(
                    color: const Color.fromARGB(255, 102, 227, 141),
                    disabledColor: const Color.fromARGB(255, 214, 155, 53),
                    borderRadius: BorderRadius.circular(30),
                    onPressed: () {
                      //_handleSignOut();
                      EasyLoading.show(status: "Đang đăng nhập,vui lòng đợi ");

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                      EasyLoading.dismiss();
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 15,
                          //color: Colors.black,
                          decoration: TextDecoration.none),
                    )),
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.only(left: 120, right: 40),
                child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                            onTap: signInWithFB,
                            child: const Icon(
                              Icons.facebook_outlined,
                              color: Colors.blue,
                              size: 30,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: signInWithGG,
                            child: const Icon(
                              Icons.g_mobiledata_sharp,
                              color: Colors.blue,
                              size: 30,
                            )),
                      ],
                    )),
              ),
              SizedBox(
                //height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        child: Center(
                            child: Center(
                          child: Text(
                            "Don't have an acount? ",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        )),
                      ),
                      SizedBox(
                        child: Center(
                            child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign up ",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.orange,
                                  fontSize: 15),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
