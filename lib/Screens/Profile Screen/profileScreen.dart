import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    // setState(() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc('6363850983')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print(documentSnapshot.data());
        doc.addAll(documentSnapshot.data() as Map<String, dynamic>);
        searchHistory = doc['history'];
        // print(doc['history']);
        // print(searchHistory.length);
      }
    });
    // });
  }

  @override
  void initState() {
    getsearchHistory();
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
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  color: kSubPrimaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 40,
                        color: kSubSecondaryColor,
                      ),
                    ),
                    const Text(
                      "User Name\nMobile Number/Email id",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: kSubSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.bedtime,
                    //     color: kSubSecondaryColor,
                    //   ),
                    // ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sunny,
                        color: kSubSecondaryColor,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: ListView.builder(
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 10,
                      shadowColor: kDarkThemeColor,
                      borderRadius: BorderRadius.circular(20),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: kPrimaryColor,
                            width: 1,
                          ),
                        ),
                        tileColor: kSubSecondaryColor.withOpacity(0.8),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Australian Dollar",
                                    style: TextStyle(
                                      color: kSubPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "£ ${searchHistory.keys.toList()[index]}",
                                    style: const TextStyle(
                                      letterSpacing: 3,
                                      color: kSubPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "£",
                                        style: TextStyle(
                                          color: kSubPrimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        "100.79",
                                        style: TextStyle(
                                          color: kSubPrimaryColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Spacer(),
                              const Icon(
                                CupertinoIcons.arrow_2_circlepath,
                                color: kSubPrimaryColor,
                                size: 30,
                              ),
                              // Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "EURO",
                                    style: TextStyle(
                                      color: kSubPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "₹ ${searchHistory.values.toList()[index]}",
                                    style: const TextStyle(
                                      letterSpacing: 3,
                                      color: kSubPrimaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        "₹",
                                        style: TextStyle(
                                          color: kSubPrimaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        "1.00",
                                        style: TextStyle(
                                          color: kSubPrimaryColor,
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
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
