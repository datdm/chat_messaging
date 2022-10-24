import 'package:flutter/material.dart';

class MyChart1 extends ChangeNotifier  {
  String chart = "";

  void something() {
    chart = "CHART T 1";
    notifyListeners();
  }
}

class MyChart2 extends ChangeNotifier  {
  String chart = "";

  void something2() {
    chart = "CHART T 2";
    notifyListeners();
  }
}
