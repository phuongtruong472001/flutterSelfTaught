import 'package:flutter/material.dart';
import 'package:row/blocs/login_bloc.dart';
import 'package:row/welcome.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInPage(),
    );
  }
}

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  LoginBloc bloc = new LoginBloc();
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image(
                image: AssetImage('assets/welcome.jpg'),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: StreamBuilder(
                      stream: bloc.userStream,
                      builder: (context, snapshot) => TextField(
                          controller: _userController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'UserName',
                            hintText: 'Enter UserName',
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                          ))),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: StreamBuilder(
                      stream: bloc.passwordStream,
                      builder: (context, snapshot)  => TextField(
                          controller: _passController,
                          obscureText: isHiddenPassword,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  isHiddenPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,),
                      )
                      ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: FlatButton(
                      onPressed: () {
                        if (bloc.isValidInformation(_userController.text,
                            _passController.text)) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Welcome()));
                        }
                      },
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 15),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    // if(isHiddenPassword==true){
    //   isHiddenPassword=false;
    // }
    // else{
    //   isHiddenPassword=true;
    // }

    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      color: Colors.red,
      margin: EdgeInsets.all(20),
    );
  }
}
