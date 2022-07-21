import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Animation/custom_page_route.dart';
import 'package:test_login/Screens/Login/login_screen.dart';

import '../../sevice.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenPage createState() => SignUpScreenPage();
}

class SignUpScreenPage extends State<SignUpScreen> {
  TextEditingController fullnameController = TextEditingController();
  String notifications = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool showPass = false;

  //FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
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
                          onPressed: () {
                            Navigator.of(context).push(CustomPageRoute(
                                child: LoginScreen(),
                                direction: AxisDirection.left));
                          },
                        ),
                      ),
                      const Expanded(
                          flex: 8,
                          child: Center(
                            child: Text(
                              "REGISTER AN ACCOUNT",
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
              const SizedBox(),
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
              Container(
                margin: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 20,
                ),
                height: 50,
                child: TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      labelText: "Enter your fullname",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                height: 50,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                height: 50,
                child: TextField(
                  obscureText: !showPass,
                  controller: passController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: showPass == true
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(Icons.access_time),
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                      ),
                      hintText: 'Password',
                      labelText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 20),
                height: 50,
                child: TextField(
                  obscureText: true,
                  controller: confirmPassController,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      labelText: "Enter your confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: CupertinoButton(
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(
                          fontSize: 15,
                          //color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    color: const Color.fromARGB(255, 102, 227, 141),
                    disabledColor: const Color.fromARGB(255, 214, 155, 53),
                    borderRadius: BorderRadius.circular(30),
                    onPressed: () {
                      SnackBar snackBar;
                      if (emailController.text.isEmpty ||
                          fullnameController.text.isEmpty ||
                          passController.text.isEmpty ||
                          confirmPassController.text.isEmpty) {
                        notifications = "vui lòng nhập đầy đủ thông tin ";
                      } else if (passController.text !=
                          confirmPassController.text) {
                        notifications = "vui lòng xác nhận lại mật khẩu";
                      } else {
                        String email = emailController.text.trim();
                        String pass = passController.text.trim();
                        String name = fullnameController.text.trim();
                        context
                            .read<AuthService>()
                            .signUp(email, pass, name)
                            .then((value) async {
                          User? user = FirebaseAuth.instance.currentUser;
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(user?.uid)
                              .set({
                            'uid': user?.uid,
                            'email': email,
                            'password': pass,
                            'name': name
                          });

                          await showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: value == true
                                        ? const Text(
                                            'Bạn đã đăng kí thành công')
                                        : const Text('Đăng kí thất bại'),
                                    actions: <Widget>[
                                      value == true
                                          ? TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()));
                                              },
                                            )
                                          : TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                    ],
                                  ));
                        });
                      }
                      snackBar = SnackBar(
                        content: Text(notifications),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      child: Center(
                          child: Center(
                        child: Text(
                          "Do you have an acount? ",
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
                            Navigator.of(context).push(CustomPageRoute(
                                child: LoginScreen(),
                                direction: AxisDirection.left));
                          },
                          child: const Text(
                            "Sign in ",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
