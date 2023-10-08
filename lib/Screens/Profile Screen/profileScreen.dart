// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
// import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/currencyCard.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';
  User user;

  ProfileScreen({required this.user, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> searchHistory = {};
  final Map<String, dynamic> doc = {};
  bool _lightThemeSelected = false;
  String docID = "";

  Functions functions = Functions();

  final Color sinColor = appTheme.colorScheme.primary;
  final Color cosColor = appTheme.colorScheme.secondary;
  final limitCount = 100;
  final sinPoints = <FlSpot>[];
  final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.05;

  late Timer timer;

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [sinColor.withOpacity(0.2), sinColor],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  LineChartBarData cosLine(List<FlSpot> points) {
    return LineChartBarData(
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
      gradient: LinearGradient(
        colors: [cosColor.withOpacity(0.2), cosColor],
        stops: const [0.1, 1.0],
      ),
      barWidth: 4,
      isCurved: false,
    );
  }

  void startAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      while (sinPoints.length > limitCount) {
        sinPoints.removeAt(0);
        cosPoints.removeAt(0);
      }
      setState(() {
        sinPoints.add(FlSpot(xValue, math.sin(xValue)));
        cosPoints.add(FlSpot(xValue, math.cos(xValue)));
      });
      xValue += step;
    });
  }

  @override
  void initState() {
    setState(() {
      docID = widget.user.email != ""
          ? widget.user.email.toString()
          : widget.user.phoneNumber.toString().replaceFirst("+91", "");
    });
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 0.45,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: LineChart(
                    duration: const Duration(seconds: 1),
                    LineChartData(
                      minY: -1,
                      maxY: 1,
                      minX: sinPoints.first.x,
                      maxX: sinPoints.last.x,
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData.all(),
                      gridData: const FlGridData(
                        show: false,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        sinLine(sinPoints),
                        cosLine(cosPoints),
                      ],
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.rotate(
              angle: 0.45,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: LineChart(
                    duration: const Duration(seconds: 1),
                    LineChartData(
                      minY: -1,
                      maxY: 1,
                      minX: sinPoints.first.x,
                      maxX: sinPoints.last.x,
                      lineTouchData: const LineTouchData(enabled: false),
                      clipData: const FlClipData.all(),
                      gridData: const FlGridData(
                        show: false,
                        drawVerticalLine: false,
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        sinLine(sinPoints),
                        cosLine(cosPoints),
                      ],
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.displayName.toString(),
                          style: TextStyle(
                            color: appTheme.colorScheme.surface,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          docID,
                          style: TextStyle(
                            color: appTheme.colorScheme.surface,
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    _lightThemeSelected == false
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                MyApp.setTheme(context, DarkTheme);
                                _lightThemeSelected = true;
                              });
                            },
                            icon: Icon(
                              Icons.bedtime,
                              color: appTheme.colorScheme.primary,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                MyApp.setTheme(context, LightTheme);
                                _lightThemeSelected = false;
                              });
                            },
                            icon: Icon(
                              Icons.sunny,
                              color: appTheme.colorScheme.primary,
                              size: 30,
                            ),
                          ),
                  ],
                ),
              ),
              Text(
                "Conversion History",
                style: TextStyle(
                  color: appTheme.colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.25,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(docID)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        searchHistory = snapshot.data!['history'];
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            String base = searchHistory.keys.elementAt(index);
                            String target =
                                searchHistory.values.elementAt(index);

                            Locale locale = Localizations.localeOf(context);
                            String baseSymbol = NumberFormat.simpleCurrency(
                                    locale: locale.toString(), name: base)
                                .currencySymbol;
                            String targetSymbol = NumberFormat.simpleCurrency(
                                    locale: locale.toString(), name: target)
                                .currencySymbol;

                            return AnimationConfiguration.staggeredList(
                              position: index,
                              child: SlideAnimation(
                                duration: const Duration(seconds: 2),
                                child: FadeInAnimation(
                                  duration: const Duration(seconds: 1),
                                  child: FutureBuilder(
                                    future:
                                        functions.getExchangeRate(base, target),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        String targetValue =
                                            snapshot.data.toString();

                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height: 205,
                                                child: Stack(children: [
                                                  CurrencyCard(
                                                    tragetValue: targetValue,
                                                    bottom: false,
                                                    currency: base,
                                                    symbol: baseSymbol,
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: CurrencyCard(
                                                      tragetValue: targetValue,
                                                      bottom: true,
                                                      currency: target,
                                                      symbol: targetSymbol,
                                                    ),
                                                  ),
                                                  Positioned(
                                                      right: 10,
                                                      top: 80,
                                                      child: Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: appTheme
                                                                    .colorScheme
                                                                    .background,
                                                                width: 4),
                                                            color: appTheme
                                                                .colorScheme
                                                                .primary
                                                                .withOpacity(
                                                                    0.2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25),
                                                            child:
                                                                BackdropFilter(
                                                              filter: ImageFilter
                                                                  .blur(
                                                                      sigmaX:
                                                                          20,
                                                                      sigmaY:
                                                                          10),
                                                              child: Icon(
                                                                  Icons
                                                                      .swap_vert_rounded,
                                                                  color: appTheme
                                                                      .colorScheme
                                                                      .surface,
                                                                  size: 40),
                                                            ),
                                                          ))),
                                                ]),
                                              ),
                                            ),
                                            Divider(
                                              color: appTheme
                                                  .colorScheme.onSecondary
                                                  .withOpacity(0.5),
                                              endIndent: 75,
                                              indent: 75,
                                              thickness: 1,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: searchHistory.length,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
