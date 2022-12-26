import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_login/Screens/Home_screen/bloc/home_bloc.dart';
import 'package:test_login/Screens/Home_screen/home.dart';
import 'package:test_login/Screens/Login/login_screen.dart';
import 'package:test_login/shopping_resposity.dart';
import 'package:test_login/simple_bloc_obsever.dart';

import 'Screens/Cart_screen/bloc/cart_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await GetStorage.init();
  //await Firebase.initializeApp();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp( MyApp(shoppingRepository: ShoppingRepository(),));
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
  const MyApp({Key? key,required this.shoppingRepository}) : super(key: key);
  final ShoppingRepository shoppingRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            shoppingRepository: shoppingRepository,
          )..add(HomeStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Home(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
