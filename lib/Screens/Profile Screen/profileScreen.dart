import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> searchHistory = {};
  final Map<String, dynamic> doc = {};

  void getsearchHistory() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc('6363850983')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print(documentSnapshot.data());
          doc.addAll(documentSnapshot.data() as Map<String, dynamic>);
          searchHistory = doc['history'];

          // print(doc['history']);
          // print(searchHistory.length);
        }
      });
    } catch (e) {
      print(e);
    }
    // });
  }

  @override
  void initState() {
    setState(() {
      searchHistory = {
        "AED": "IND",
        "GBP": "INR",
        "USD": "AED",
        "INR": "AED",
        "IND": "USD"
      };
    });
    getsearchHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              // topLeft: Radius.circular(20),
              // topRight: Radius.circular(20),
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kSubSecondaryColor.withOpacity(0.2),
                // borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Icon(
                  //     Icons.account_circle_rounded,
                  //     size: 40,
                  //     color: kPrimaryColor1,
                  //   ),
                  // ),
                  const Text(
                    "User Name\nMobile Number/Email id",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.bedtime,
                  //     color: kSubSecondaryColor,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sunny,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            "Search History",
            style: TextStyle(
              color: kSubSecondaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.45,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      duration: const Duration(seconds: 2),
                      child: FadeInAnimation(
                        duration: const Duration(seconds: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            elevation: 10,
                            shadowColor: kDarkThemeColor,
                            borderRadius: BorderRadius.circular(20),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: kSecondaryColor,
                                  width: 1,
                                ),
                              ),
                              tileColor: kPrimaryColor.withOpacity(0.2),
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Dollar",
                                            style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "£ ${searchHistory.keys.toList()[index]}",
                                            style: const TextStyle(
                                              letterSpacing: 3,
                                              color: kSecondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                "£",
                                                style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "100.79",
                                                style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Icon(
                                        CupertinoIcons.arrow_2_circlepath,
                                        color: kSecondaryColor,
                                        size: 30,
                                      ),
                                    ),
                                    // Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "EURO",
                                            style: TextStyle(
                                              color: kSecondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "₹ ${searchHistory.values.toList()[index]}",
                                            style: const TextStyle(
                                              letterSpacing: 3,
                                              color: kSecondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                "₹",
                                                style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                "1.00",
                                                style: TextStyle(
                                                  color: kSecondaryColor,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
