import 'dart:async';

import 'package:exchange_xpert/Constants/constsnt.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool s = true;
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        s = !s;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedContainer(
                height: MediaQuery.of(context).size.width / 1.5,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3)),
                  color: s == true ? kPrimaryColor : kSecondaryColor ,
                  shape: BoxShape.rectangle,
                ),
                duration: Duration(
                  seconds: 2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 2),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 2)),
                  color: kPrimaryColor1,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 4),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 4)),
                  color: kSecondaryColor,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("ExchangeXpert"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSecondaryColor1,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Text("€"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Text(" £"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Text("¥"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Text("₹"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                      child: const Text(" د.إ"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
