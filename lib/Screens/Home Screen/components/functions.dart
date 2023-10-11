import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class Functions {
  // final String apiUrl = "http://api.exchangeratesapi.io/v1/";
  final String apiUrl = "http://data.fixer.io/api/";

  // final String accessKey = "access_key=ac1a360a2533fd4fb58caa7aa66ae2c0";
  final String accessKey = "access_key=d0f9c70025aaee83fb5ca5c7184228bd";

  Future<List<FlSpot>> getConversionRate(
      String baseCurrency, String targetCurrency, User user) async {
    String docID = user.email != ""
        ? user.email.toString()
        : user.phoneNumber.toString().replaceFirst("+91", "");
    // print(docID);
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(docID).get();

    Map<String, dynamic> history;

    try {
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        if (userData.containsKey("history")) {
          history = userData["history"];
        } else {
          history = {};
        }
        if (history.keys.length == 5) {
          history.remove(history.keys.last);
        }

        if (history.containsKey(baseCurrency)) {
          history.update(baseCurrency, (value) => targetCurrency);
        }else{
          history.addAll({baseCurrency: targetCurrency});
        }

        FirebaseFirestore.instance
            .collection('Users')
            .doc(docID)
            .update({"history": history});
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print(e);
    }

    // get last 4 days date and store in list
    List<String> dates = [];
    List<FlSpot> chartPoints = [];
    for (int i = 4; i > 0; i--) {
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
        // double target = Random().nextDouble();
        // reduce to 2 decimal places
        target = double.parse(target.toStringAsFixed(2));
        print(target);
        chartPoints.add(FlSpot(double.parse(i.toString()), target * 100));
      }

      return chartPoints;
    } catch (e) {
      print(e);
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

      // double baseC = Random().nextDouble();
      // double targetC = Random().nextDouble();

      targetC = targetC / baseC;
      // reduce to 2 decimal places
      targetC = double.parse(targetC.toStringAsFixed(2));
      // print(targetC);

      return targetC.toString();
    } catch (e) {
      // print(e);
      return "";
    }
  }
}
