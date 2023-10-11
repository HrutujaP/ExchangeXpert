// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:exchange_xpert/Screens/Home%20Screen/components/chart.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/countUpAnimation.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/currency_menu.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/animatedChart.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/profileScreen.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:particles_fly/particles_fly.dart';
import '../../Constants/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = "homeScreen";
  User user;
  HomeScreen({required this.user, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Functions functions = Functions();

  String base = "AED";
  String target = "AED";
  int quantity = 1;

  bool isAnimating = false;

  Future<List<FlSpot>>? graphData;
  Future<String>? exchangeRate;

  void changeBase(String value) {
    setState(() {
      exchangeRate = null;
      graphData = null;
      base = value;
    });
  }

  void changeTarget(String value) {
    setState(() {
      exchangeRate = null;
      graphData = null;
      target = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 500),
                child: Stack(
                  children: [
                    FadeInAnimation(
                      duration: const Duration(seconds: 5),
                      child: ParticlesFly(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        // connectDots: true,
                        numberOfParticles: 15,
                        speedOfParticles: 1,
                        // isRandSize: true,
                        onTapAnimation: true,
                        particleColor: appTheme.colorScheme.surface,
                        lineColor: appTheme.colorScheme.surface,
                        enableHover: true,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                "${widget.user.displayName.toString().split(" ")[0]} 👋",
                                style: const TextStyle(
                                    color: lPrimaryColor1,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold)),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen(
                                              user: widget.user,
                                            )));
                              },
                              icon: const Icon(
                                Icons.person_rounded,
                                color: lPrimaryColor1,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Let's Convert",
                          style: TextStyle(
                              color: appTheme.colorScheme.surface,
                              letterSpacing: 3,
                              fontSize: 28,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FadeInAnimation(
                          duration: const Duration(seconds: 3),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: appTheme.colorScheme.surface
                                        .withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                color: lSecondaryColor.withOpacity(
                                    0.1) // Set the background color
                                ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "From",
                                        style: TextStyle(
                                          color: appTheme
                                              .colorScheme.primaryContainer,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.045,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: TextField(
                                          onChanged: (value) {
                                            setState(() {
                                              quantity = int.parse(value);
                                            });
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                              color:
                                                  appTheme.colorScheme.surface,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900),
                                          decoration: InputDecoration(
                                            hintText: "Enter Quantity",
                                            hintStyle: TextStyle(
                                                color: appTheme
                                                    .colorScheme.surface,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            fillColor: appTheme
                                                .colorScheme.secondary
                                                .withOpacity(0.4),
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      CurrencyMenu(
                                        changeCurrency: changeBase,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                    thickness: 1,
                                    indent: 50,
                                    endIndent: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "To",
                                        style: TextStyle(
                                          color: appTheme
                                              .colorScheme.primaryContainer,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.045,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Spacer()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height: 60,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: appTheme
                                                .colorScheme.secondary
                                                .withOpacity(
                                                    0.4), // Set the background color
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Visibility(
                                                visible: isAnimating &&
                                                    exchangeRate != null,
                                                replacement: Text(
                                                  "0.00",
                                                  style: TextStyle(
                                                      color: appTheme
                                                          .colorScheme.surface,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                child: FutureBuilder(
                                                  future: exchangeRate,
                                                  builder: (context, snapshot) {
                                                    if (!snapshot.hasData) {
                                                      return const CircularProgressIndicator();
                                                    }
                                                    double value = quantity *
                                                        double.parse(snapshot
                                                            .data
                                                            .toString());

                                                    value = double.parse(value
                                                        .toStringAsFixed(2));

                                                    return CountUpAnimation(
                                                      targetNumber: value,
                                                      duration: const Duration(
                                                          seconds: 3),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      CurrencyMenu(
                                        changeCurrency: changeTarget,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Visibility(
                            visible: isAnimating && exchangeRate != null,
                            replacement: const SizedBox(),
                            child: FutureBuilder(
                              future: graphData,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Transform.rotate(
                                        angle: -0.45,
                                        child: AnimatedChart(
                                            alignment: Alignment.center)),
                                  );
                                }
                                return FadeInAnimation(
                                  duration: const Duration(milliseconds: 1500),
                                  child: Material(
                                    color: appTheme.colorScheme.secondary
                                        .withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(20.0),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chart(
                                        spots: snapshot.data!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: isAnimating && exchangeRate != null,
                          replacement: const SizedBox(),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 1500),
                            child: FutureBuilder(
                                future: exchangeRate,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(children: [
                                      Text(
                                        '1 $base = ${snapshot.data} $target',
                                        style: TextStyle(
                                          color: appTheme.colorScheme.surface,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ]),
                                  );
                                }),
                          ),
                        ),
                        const Spacer(),
                        ScaleAnimation(
                          duration: const Duration(milliseconds: 1500),
                          child: TextButton(
                            isSemanticButton: true,
                            autofocus: true,
                            onPressed: () {
                              setState(() {
                                graphData = functions.getConversionRate(
                                    base, target, widget.user);
                                exchangeRate =
                                    functions.getExchangeRate(base, target);

                                isAnimating = true;
                              });
                            },
                            style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.all<double>(10),
                                shadowColor: MaterialStateColor.resolveWith(
                                    (states) => lSubSecondaryColor),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10)),
                                backgroundColor:
                                    MaterialStateProperty.all(lSecondaryColor1),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Convert $base to $target",
                                style: const TextStyle(
                                    color: lSubPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
