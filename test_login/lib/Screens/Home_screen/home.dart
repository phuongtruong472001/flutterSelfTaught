import 'package:flutter/material.dart';
import 'package:test_login/Screens/Home_screen/my_home.dart';
import 'package:test_login/Screens/Home_screen/my_profile.dart';
import 'package:test_login/Screens/Home_screen/my_statistical.dart';

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  int selectedIndex = 0;
  final Widget _myHome = MyHome();
  final Widget _myStatistical = BarChartSample3();
  final Widget _myProfile = MyProfile();
  @override
  Widget build(BuildContext context) {
    Widget getBody() {
      if (selectedIndex == 0) {
        return _myHome;
      } else if (selectedIndex == 1) {
        return _myStatistical;
      } else {
        return _myProfile;
      }
    }

    void onTapHandler(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Home")
        ],
        onTap: onTapHandler,
      ),
      body: getBody(),
    ));
  }
}
