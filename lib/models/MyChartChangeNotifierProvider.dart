import 'package:flutter/material.dart';

class MyChartChangeNotifierProvider extends ChangeNotifier  {
  String chart = "";

  void something() {
    chart = "CHART T";
    notifyListeners();
  }
}