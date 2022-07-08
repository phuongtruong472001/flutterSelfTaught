import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  LoginScreenPage createState() => LoginScreenPage();
}

class LoginScreenPage extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool checkRemmember = false;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children:  <Widget>[
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                         onPressed: (){},
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
              margin:const EdgeInsets.all(40),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: "Enter your email",
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
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: checkRemmember,
                      onChanged: (bool value) {
                        setState(() {
                          checkRemmember = value;
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
              width: 400,
              child: CupertinoButton(
                  color: Color.fromARGB(255, 102, 227, 141),
                  disabledColor: Color.fromARGB(255, 214, 155, 53),
                  borderRadius: BorderRadius.circular(30),
                  onPressed: () {},
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 15,
                        //color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
            ),
            SizedBox(
              child: Padding(
                  padding:const EdgeInsets.only(left: 200, right: 200),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook_outlined,
                            color: Colors.blue,
                          )),
                     
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.g_mobiledata_sharp,
                            color: Colors.blue,
                          )),
                          
                    ],
                  )),
            ),
             Padding(
               padding: const EdgeInsets.only(left:150),
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
                    child:const Text(
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
             )
          ],
        ),
      ),
    );
  }
}
