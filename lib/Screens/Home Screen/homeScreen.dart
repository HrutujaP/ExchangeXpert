// ignore_for_file: must_be_immutable

import 'package:exchange_xpert/Screens/Home%20Screen/components/chart.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/currency_menu.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/animatedChart.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/profileScreen.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
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

  bool isAnimating = false;

  Future<List<FlSpot>>? graphData;
  Future<String>? exchangeRate;

  void changeBase(String value) {
    setState(() {
      base = value;
      isAnimating = false;
    });
  }

  void changeTarget(String value) {
    setState(() {
      target = value;
      isAnimating = false;
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
                        connectDots: true,
                        numberOfParticles: 10,
                        speedOfParticles: 1,
                        isRandSize: true,
                        onTapAnimation: true,
                        particleColor: appTheme.colorScheme.primary,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            const Spacer(),
                            const Spacer(),
                            Expanded(
                                child: IconButton(
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
                            )),
                          ],
                        ),
                        Text(
                          "Convert",
                          style: TextStyle(
                              color: appTheme.colorScheme.primary,
                              letterSpacing: 3,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
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
                                    color: lSubSecondaryColor.withOpacity(0.2),
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
                                  Text(
                                    "From",
                                    style: TextStyle(
                                      color:
                                          appTheme.colorScheme.primaryContainer,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  CurrencyMenu(
                                    changeCurrency: changeBase,
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                    thickness: 1,
                                    indent: 50,
                                    endIndent: 50,
                                  ),
                                  const Text(
                                    "To",
                                    style: TextStyle(
                                      color: lSubSecondaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  CurrencyMenu(
                                    changeCurrency: changeTarget,
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
                            visible: isAnimating && graphData != null,
                            replacement: Lottie.asset(
                              'assets/animations/money-receive.json',
                              height: 200,
                              width: 200,
                              repeat: true,
                              reverse: true,
                            ),
                            child: FutureBuilder(
                              future: graphData,
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Transform.rotate(
                                      angle: -0.45,
                                      child: AnimatedChart(
                                          alignment: Alignment.center));
                                }
                                return FadeInAnimation(
                                  duration: const Duration(milliseconds: 1500),
                                  child: Chart(
                                    spots: snapshot.data!,
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
                                          color: appTheme.colorScheme.primary,
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
                            child: Text(
                              "Convert $base to $target",
                              style: const TextStyle(
                                  color: lSubPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
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
