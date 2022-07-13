import 'package:flutter/material.dart';

class StartApp extends ChangeNotifier {
  bool isGetData = false;
  //bool isGetAccoutSave = false;
  bool isGetBill = false;

  void resetgetData() {
    isGetBill = false;
  }

  void getDataComplete() {
    isGetData = true;
  }

  void getBillComplete() {
    isGetBill = true;
  }

  
}