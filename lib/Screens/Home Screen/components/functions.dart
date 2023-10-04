import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class Functions {
  // final String apiUrl = "http://api.exchangeratesapi.io/v1/";
  final String apiUrl = "http://data.fixer.io/api";
  // final String accessKey = "access_key=e2f8659649a9fc05e84f228a8b1b11ed";
  final String accessKey = "access_key=94ccfa21a53fc37c5323cabc3e7aafe3";

  Future<List<FlSpot>> getConversionRate(
      String baseCurrency, String targetCurrency) async {
    // get last 4 days date and store in list
    List<String> dates = [];
    List<FlSpot> chartPoints = [];
    for (int i = 7; i > 0; i--) {
      dates.add(DateTime.now()
          .subtract(Duration(days: i))
          .toString()
          .substring(0, 10));
      // chartPoints.add(FlSpot(double.parse(i.toString()), Random().nextDouble()));
    }
    dates.add("latest");
    try {
      // get conversion rate for each date
      for (int i = 0; i < dates.length; i++) {
        String url =
            "$apiUrl/${dates[i]}?$accessKey&symbols=$baseCurrency,$targetCurrency";
        http.Response response = await http.get(Uri.parse(url));
        Map<String, dynamic> data = jsonDecode(response.body);
        double base = data["rates"][baseCurrency];
        double target = data["rates"][targetCurrency];

        target = target / base;
        // reduce to 2 decimal places
        target = double.parse(target.toStringAsFixed(2));
        // print(target);
        chartPoints.add(FlSpot(double.parse(i.toString()), target));
      }

      return chartPoints;
    } catch (e) {
      // print(e);
      return [];
    }
  }

  Future<String> getExchangeRate(String base, String target) async {
    try {
      // get conversion rate for today

      String url = "$apiUrl/latest?$accessKey&symbols=$base,$target";
      http.Response response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);
      double baseC = data["rates"][base];
      double targetC = data["rates"][target];

      targetC = targetC / baseC;
      // reduce to 2 decimal places
      targetC = double.parse(targetC.toStringAsFixed(2));
      print(targetC);

      return targetC.toString();
    } catch (e) {
      // print(e);
      return "";
    }
  }
}
