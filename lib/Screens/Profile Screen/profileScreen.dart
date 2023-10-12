// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
// import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/animatedChart.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/currencyCard.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    setState(() {
      docID = widget.user.email != ""
          ? widget.user.email.toString()
          : widget.user.phoneNumber.toString().replaceFirst("+91", "");
    });
    print(docID);
    // startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorScheme.background,
      body: SafeArea(
          child: Stack(
        children: [
          const AnimatedCharts(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          size: 40,
                          color: appTheme.colorScheme.surface,
                        )),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, //start
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
                    const Spacer(
                      flex: 2,
                    ),
                    IconButton(
                      onPressed: !_lightThemeSelected
                          ? () {
                              setState(() {
                                MyApp.setTheme(context, DarkTheme);
                                _lightThemeSelected = true;
                              });
                            }
                          : () {
                              setState(() {
                                MyApp.setTheme(context, LightTheme);
                                _lightThemeSelected = false;
                              });
                            },
                      icon: Icon(
                        !_lightThemeSelected ? Icons.bedtime : Icons.sunny,
                        color: !_lightThemeSelected
                            ? appTheme.colorScheme.surface
                            : appTheme.colorScheme.primary,
                        size: 30,
                      ),
                    )
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
                  height: MediaQuery.of(context).size.height * 0.8,
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

class AnimatedCharts extends StatelessWidget {
  const AnimatedCharts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedChart(alignment: Alignment.topCenter),
        AnimatedChart(alignment: Alignment.bottomCenter),
      ],
    );
  }
}
