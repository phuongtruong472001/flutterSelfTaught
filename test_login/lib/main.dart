import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:test_login/Models/bills.dart';
import 'package:test_login/Models/category.dart';
import 'package:test_login/Models/product.dart';
import 'package:test_login/Screens/Home_screen/home.dart';
import 'package:test_login/Screens/Login/login_screen.dart';
import 'package:test_login/Screens/Profile/edit_address.dart';
import 'package:test_login/Screens/Profile/edit_profile.dart';
import 'package:test_login/Screens/SignUp/sign_up_screen.dart';
import 'package:test_login/Screens/YourOrders/your_orders.dart';
import 'package:test_login/loaded.dart';
import 'package:test_login/sevice.dart';

void main() async {
  await GetStorage.init();
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          ChangeNotifierProvider.value(
            value: ListFavorites(),
          ),
          ChangeNotifierProvider.value(
            value: Carts(),
          ),
          ChangeNotifierProvider.value(
            value: ItemBills(),
          ),
          ChangeNotifierProvider.value(
            value: StartApp(),
          ),
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          // StreamProvider(
          //   create: (context) => context.read<AuthService>().authStateChanges,
          //   initialData: null,
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: LoginScreen(),
          builder: EasyLoading.init(),
        ));
  }
}

// class InitializerWidget extends StatefulWidget {
//   @override
//   _InitializerWidgetState createState() => _InitializerWidgetState();
// }

// class _InitializerWidgetState extends State<InitializerWidget> {
//   late FirebaseAuth _auth;

//   late User _user;

//   bool isLoading = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _auth = FirebaseAuth.instance;
//     _user = _auth.currentUser!;
//     isLoading = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : _user == null
//             ? LoginScreen()
//             : Home();
//   }
// }
