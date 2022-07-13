import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  EditProfilePage createState() => EditProfilePage();
}

class EditProfilePage extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Center(
                          child: Text(
                            "Account Information",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Full name"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Email"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Phone"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Address"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: CupertinoButton(
                        color: const Color.fromARGB(255, 224, 140, 80),
                        disabledColor: const Color.fromARGB(255, 214, 155, 53),
                        borderRadius: BorderRadius.circular(30),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 15,
                              //color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
