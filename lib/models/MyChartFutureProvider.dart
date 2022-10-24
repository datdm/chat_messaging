class MyChartFutureProvider {
  String chart = "";

  MyChartFutureProvider({ required this.chart });

  Future<void> something() async {
    await Future.delayed(const Duration(seconds: 3));
    chart = "CHART T";
  }
}