import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                )),
            alignment: Alignment.topLeft,
          ),
        ),
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://res.cloudinary.com/dzsi7dmey/image/upload/v1624055714/ampdrzexlkdcpaufziig.png"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text("Truong Phuong"),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: ListTile(
                  title: Center(child: Text("08")),
                  subtitle: Center(child: Text("My order")),
                )),
            Expanded(
                flex: 1,
                child: ListTile(
                  title: Center(child: Text("07")),
                  subtitle: Center(child: Text("Wishlist")),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            // scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: new Text("Men"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_men.png")),
              ),
              ListTile(
                title: new Text("Women"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_woman.png")),
              ),
              ListTile(
                title: new Text("Baby & Kids"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_kids.png")),
              ),
              ListTile(
                title: new Text("Bags"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_bag.png")),
              ),
              ListTile(
                title: new Text("Decor"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_decor.png")),
              ),
              ListTile(
                title: new Text("Sport"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/ic_sports.png")),
              ),
            ],
          ),
        ),
        Column(
            // scrollDirection: Axis.vertical,
            children: [
              ListTile(
                title: new Text("Account"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/user.png")),
              ),
              ListTile(
                title: new Text("Setting"),
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: Image.asset("icons/settings.png")),
              ),
            ]),
      ],
    );
  }
}
