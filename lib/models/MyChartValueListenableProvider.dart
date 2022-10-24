import 'package:flutter/material.dart';

class MyChartValueListenableProvider {
  ValueNotifier<String> chart = ValueNotifier("");

  void something() {
    chart.value = "CHART T";
  }
}