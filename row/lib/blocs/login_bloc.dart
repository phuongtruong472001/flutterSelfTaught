
import 'dart:async';
import 'dart:io';

import 'package:row/blocs/validations.dart';

class LoginBloc{
    final StreamController _userController=new StreamController();
    final StreamController _passwordController=new StreamController();
    
    Stream get userStream =>_userController.stream;
    Stream get passwordStream =>_passwordController.stream;


    bool isValidInformation(String username,String password){
      if(!Validations.isValidUser(username)){
        _userController.sink.addError("username no valid !");
        return false;
      }
      _userController.sink.add('Ok');
       if(!Validations.isValidPassword(password)){
        _passwordController.sink.addError("password no valid !");
        return false;
      }  
      _passwordController.sink.add('Ok');
      return true; 
    }
    void dispose(){
      _userController.close();
      _passwordController.close();
    }
}