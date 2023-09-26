import 'package:exchange_xpert/Screens/Home%20Screen/components/chart_point.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';

import 'package:exchange_xpert/Screens/Home%20Screen/components/line_chart.dart';

import '../../Constants/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSubPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.menu),
                      Spacer(),
                      Text(
                        "Converter",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                      Text("History"),
                      Spacer(),
                      Text("Settings")
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [CurrencyMenu(), Spacer(), CurrencyMenu()],
                  ),
                  // MyLineChart()
                  SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: functions.getConversionRate("GBP", "INR"),
                      builder: (context, snapshot) {  
                        if(!snapshot.hasData){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        return LineChart(
                          xAxisLabel: 'GBP',
                          yAxisLabel: 'INR',
                          points: snapshot.data!,
                        );
                      },
                    ),
                  )
                  // GraphAnimation(),
                ],
              )),
        ),
      ),
    );
  }
}

class CurrencyMenu extends StatelessWidget {
  const CurrencyMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 10,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
                color: kSubSecondaryColor.withOpacity(0.3), width: 2),
            color: kSecondaryColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/Images/CountryFlags/gb.png",
                ),
                height: 25,
                width: 25,
              ),
            ),
            Text(
              "GBP - British Pound",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_drop_down_rounded,
                color: kSubPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
