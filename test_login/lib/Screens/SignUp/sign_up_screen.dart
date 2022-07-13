import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenPage createState() => SignUpScreenPage();
}

class SignUpScreenPage extends State<SignUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  //FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
              height: 70,
              child: TextField(
                maxLength: 10,
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: 'Phone',
                    labelText: "Enter your phone",
                    prefix: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+84'),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
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
              margin: const EdgeInsets.only(
                  left: 40, right: 40, top: 20, bottom: 20),
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
                  color: const Color.fromARGB(255, 102, 227, 141),
                  disabledColor: const Color.fromARGB(255, 214, 155, 53),
                  borderRadius: BorderRadius.circular(30),
                  onPressed: () {
                    // if (otpVisibility) {
                    //   verifyOTP();
                    // } else {
                    //   loginWithPhone();
                    // }
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(
                        fontSize: 15,
                        //color: Colors.black,
                        decoration: TextDecoration.none),
                  )),
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

  // void loginWithPhone() async {
  //   auth.verifyPhoneNumber(
  //     phoneNumber: "+91" + phoneController.text,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential).then((value) {
  //         print("You are logged in successfully");
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       otpVisibility = true;
  //       verificationID = verificationId;
  //       setState(() {});
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  // void verifyOTP() async {
  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationID, smsCode: otpController.text);

  //   await auth.signInWithCredential(credential).then(
  //     (value) {
  //       setState(() {
  //         user = FirebaseAuth.instance.currentUser;
  //       });
  //     },
  //   ).whenComplete(
  //     () {
  //       if (user != null) {
  //         Fluttertoast.showToast(
  //           msg: "You are logged in successfully",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Home(),
  //           ),
  //         );
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: "your login is failed",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0,
  //         );
  //       }
  //     },
  //   );
  // }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";

// import '../Home_screen/home.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;

//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   late String verificationId;

//   bool showLoading = false;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });

//     try {
//       final authCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);

//       setState(() {
//         showLoading = false;
//       });

//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home()));
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });

//       _scaffoldKey.currentState
//           // ignore: deprecated_member_use
//           ?.showSnackBar(SnackBar(content: Text(e.message.toString())));
//     }
//   }

//   getMobileFormWidget(context) {
//     return Column(
//       children: [
//         const Spacer(),
//         TextField(
//           controller: phoneController,
//           decoration: const InputDecoration(
//             hintText: "Phone Number",
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         FlatButton(
//           onPressed: () async {
//             setState(() {
//               showLoading = true;
//             });

//             await _auth.verifyPhoneNumber(
//               phoneNumber: phoneController.text,
//               verificationCompleted: (phoneAuthCredential) async {
//                 setState(() {
//                   showLoading = false;
//                 });
//                 //signInWithPhoneAuthCredential(phoneAuthCredential);
//               },
//               verificationFailed: (verificationFailed) async {
//                 setState(() {
//                   showLoading = false;
//                 });
//                 _scaffoldKey.currentState?.showSnackBar(SnackBar(
//                     content: Text(verificationFailed.message.toString())));
//               },
//               codeSent: (verificationId, resendingToken) async {
//                 setState(() {
//                   showLoading = false;
//                   currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
//                   this.verificationId = verificationId;
//                 });
//               },
//               codeAutoRetrievalTimeout: (verificationId) async {},
//             );
//           },
//           child: const Text("SEND"),
//           color: Colors.blue,
//           textColor: Colors.white,
//         ),
//         const Spacer(),
//       ],
//     );
//   }

//   getOtpFormWidget(context) {
//     return Column(
//       children: [
//         const Spacer(),
//         TextField(
//           controller: otpController,
//           decoration: const InputDecoration(
//             hintText: "Enter OTP",
//           ),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         FlatButton(
//           onPressed: () async {
//             PhoneAuthCredential phoneAuthCredential =
//                 PhoneAuthProvider.credential(
//                     verificationId: verificationId,
//                     smsCode: otpController.text);

//             signInWithPhoneAuthCredential(phoneAuthCredential);
//           },
//           child: const Text("VERIFY"),
//           color: Colors.blue,
//           textColor: Colors.white,
//         ),
//         const Spacer(),
//       ],
//     );
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         body: Container(
//           child: showLoading
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                   ? getMobileFormWidget(context)
//                   : getOtpFormWidget(context),
//           padding: const EdgeInsets.all(16),
//         ));
//   }
// }
