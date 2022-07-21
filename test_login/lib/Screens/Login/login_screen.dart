import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/Animation/custom_page_route.dart';
import 'package:test_login/Screens/Home_screen/home.dart';
import 'package:test_login/Screens/SignUp/sign_up_screen.dart';

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
  final box = GetStorage();
  Map? userData;
  Future<void> signInWithGG() async {
    try {
      await _googleSignIn.signOut();

      await _googleSignIn.signIn();

      box.write('username', _currentUser?.displayName ?? "");
      box.write('status', 2);
      print(_currentUser?.displayName);
      if (_currentUser?.displayName != "") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
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

        box.write('username', userData!["name"]);
        print(userData);
        box.write('status', 1);
        EasyLoading.dismiss();
        if (userData!["name"] != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      }
    } catch (e) {
      EasyLoading.showError("Có lỗi xảy ra");
    }
  }

  Future<bool> checkAccount(String email, String password) async {
    bool isCorrect = false;
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if ((doc["email"] == email) && (doc["password"] == password)) {
          isCorrect = true;
          box.write("username", doc["name"]);
          box.write('status', 0);
        }
      }
    });
    return isCorrect;
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
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

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
                  controller: email,
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
                  controller: password,
                  obscureText: true,
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
                    children: <Widget>[
                      Checkbox(
                        value: checkRemmember,
                        onChanged: (bool? value) {
                          setState(() {
                            checkRemmember = !checkRemmember;
                          });
                        },
                      ),
                      const Expanded(
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
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      const Expanded(
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
                    onPressed: () async {
                      if (await checkAccount(
                              email.text.trim(), password.text.trim()) ==
                          true) {
                        Navigator.of(context).push(CustomPageRoute(child: Home(),direction: AxisDirection.right));
                      } else {
                        final snackBar = SnackBar(
                          content: const Text(
                              "Tài khoản hoặc mật khẩu không chính xác "),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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
                            onPressed: () {
                              Navigator.of(context)
                                  .push(CustomPageRoute(child: SignUpScreen(),direction: AxisDirection.right));
                            },
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
