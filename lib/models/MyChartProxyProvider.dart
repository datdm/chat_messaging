import 'package:flutter/material.dart';

class MyChartProxyProvider1 extends ChangeNotifier  {
  String chart = "";

  void something() {
    chart = "CHART T 1";
    notifyListeners();
  }
}

class MyChartProxyProvider2 {
  MyChartProxyProvider1 myModel1;

  MyChartProxyProvider2({ required this.myModel1 });

  void something2() {
    myModel1.something();
  }
}
