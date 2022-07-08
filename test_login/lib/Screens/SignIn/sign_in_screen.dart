import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget{
  @override
  SignInScreenPage createState()=>SignInScreenPage();


}
class SignInScreenPage extends State<SignInScreen>{
  @override
  Widget build(BuildContext context) {
  return  SafeArea(
      child: Scaffold(
        body: Column(
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
            SizedBox(),
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
              margin: const EdgeInsets.only(left: 40, right: 40,top: 20,),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Fullname',
                    labelText: "Enter your fullname",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40,top: 20,bottom: 20),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Phone',
                    labelText: "Enter your phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: "Enter your password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40,top: 20,bottom: 20),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: "Enter your confirm password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
              height: 50,
              width: 400,
              child: CupertinoButton(
                  color: Color.fromARGB(255, 102, 227, 141),
                  disabledColor: Color.fromARGB(255, 214, 155, 53),
                  borderRadius: BorderRadius.circular(30),
                  onPressed: () {},
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                        fontSize: 15,
                        //color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
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
                        onPressed: () {},
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
    );
  }

}