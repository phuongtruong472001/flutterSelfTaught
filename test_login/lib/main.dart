import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/category.dart';
import 'package:test_login/Models/product.dart';
import 'package:test_login/Screens/Home_screen/home.dart';
import 'package:test_login/Screens/Login/login_screen.dart';

import 'Screens/Login/sign_in/sign_in_with_gg.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Categories(),
          ),
          ChangeNotifierProvider.value(
            value: Products(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: Home(),
          builder: EasyLoading.init(),
        ));
  }
}
