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
  bool lightThemeSelected = false;

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
      // searchHistory = {
      //   "AED": "IND",
      //   "GBP": "INR",
      //   "USD": "AED",
      //   "INR": "AED",
      //   "IND": "USD"
      // };
      getsearchHistory();
    });
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        color: lSubSecondaryColor,
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Mobile Number/Email id",
                      style: TextStyle(
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bedtime,
                          color: lPrimaryColor,
                        ),
                      )
                    : IconButton(
                        onPressed: () {},
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
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.transparent,
                                      // width: 1,
                                    ),
                                  ),
                                  tileColor: lPrimaryColor.withOpacity(0.2),
                                  // tileColor: lightTheme.colorScheme.background,
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${searchHistory.keys.toList()[index]}",
                                                  style: const TextStyle(
                                                    letterSpacing: 3,
                                                    color: lSecondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                const Text(
                                                  "Dollar",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  "£",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  "100.79",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    CupertinoIcons.arrow_2_circlepath,
                                    color: lSecondaryColor,
                                    size: 30,
                                  ),
                                ),
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.transparent
                                        // width: 1,
                                        ),
                                  ),
                                  tileColor: lPrimaryColor.withOpacity(0.2),
                                  // tileColor: lightTheme.colorScheme.background,
                                  title: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // Spacer(),

                                        // Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "${searchHistory.values.toList()[index]}",
                                                  style: const TextStyle(
                                                    letterSpacing: 3,
                                                    color: lSecondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                const Text(
                                                  "Rupees",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  "₹",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  "1.00",
                                                  style: TextStyle(
                                                    color: lSecondaryColor,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
