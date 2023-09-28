import 'package:exchange_xpert/Screens/Home%20Screen/components/chart_point.dart';

class Functions {
  final String apiUrl = "http://api.exchangeratesapi.io/v1/";
  final String accessKey = "access_key=e2f8659649a9fc05e84f228a8b1b11ed";

  Future<List<ChartPoint>> getConversionRate(
      String baseCurrency, String targetCurrency) async {
    // get last 4 days date and store in list
    List<String> dates = [];
    for (int i = 0; i < 4; i++) {
      dates.add(DateTime.now()
          .subtract(Duration(days: i))
          .toString()
          .substring(0, 10));
    }
    // List<String> targetCurrencies = [];
    List<ChartPoint> chartPoints = [];
    List<double> conversionRates = [101.44, 101.4, 101.57, 101.71, 101.44];
    // List<double> conversionRates = [1,2,3,4,5];
    dates.add("latest");
    try {
      // get conversion rate for each date
      for (int i = 0; i < dates.length; i++) {
        // String url =
        //     "$apiUrl${dates[i]}?$accessKey&symbols=$baseCurrency,$targetCurrency";
        // http.Response response = await http.get(Uri.parse(url));
        // Map<String, dynamic> data = jsonDecode(response.body);
        // double base = data["rates"][baseCurrency];
        // double target = data["rates"][targetCurrency];

        // target = target / base;
        // // reduce to 2 decimal places
        // target = double.parse(target.toStringAsFixed(2));
        // print(target);
        chartPoints.add(ChartPoint(
            x: DateTime.now().subtract(Duration(days: i)),
            y: conversionRates[i]));
      }
      return chartPoints;
    } catch (e) {
      // print(e);
      return [];
    }
  }
}
