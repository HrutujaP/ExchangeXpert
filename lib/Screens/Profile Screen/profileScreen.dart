import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:exchange_xpert/Screens/Profile%20Screen/components/currencyCard.dart';
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
  bool lightThemeSelected = false;
  String docID = "";

  Functions functions = Functions();

  @override
  void initState() {
    docID = widget.user.email != ""
        ? widget.user.email.toString()
        : widget.user.phoneNumber.toString().replaceFirst("+91", "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
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
                      style: const TextStyle(
                        color: lSubSecondaryColor,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      docID,
                      style: const TextStyle(
                        color: lSubSecondaryColor,
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                lightThemeSelected == false
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            lightThemeSelected = true;
                          });
                        },
                        icon: const Icon(
                          Icons.bedtime,
                          color: lPrimaryColor,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            lightThemeSelected = false;
                          });
                        },
                        icon: const Icon(
                          Icons.sunny,
                          color: lPrimaryColor,
                          size: 30,
                        ),
                      ),
              ],
            ),
          ),
          const Text(
            "Conversion History",
            style: TextStyle(
              color: lSubSecondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
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
                        String target = searchHistory.values.elementAt(index);

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
                                future: functions.getExchangeRate(base, target),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    String targetValue =
                                        snapshot.data.toString();

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
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
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 4),
                                                    color: lPrimaryColor
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 20,
                                                          sigmaY: 10),
                                                      child: const Icon(
                                                          Icons
                                                              .swap_vert_rounded,
                                                          color:
                                                              lSecondaryColor,
                                                          size: 40),
                                                    ),
                                                  ))),
                                        ]),
                                      ),
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
      )),
    );
  }
}
