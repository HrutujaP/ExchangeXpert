import 'dart:async';

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcomeSscreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool containerAnimation = true;
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        containerAnimation = !containerAnimation;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.only(
                    topRight:
                        Radius.circular(MediaQuery.of(context).size.width / 3),
                    bottomRight:
                        Radius.circular(MediaQuery.of(context).size.width / 3),
                  ),
                  child: AnimatedContainer(
                    height: containerAnimation == true
                        ? MediaQuery.of(context).size.width / 1.5
                        : MediaQuery.of(context).size.width / 2,
                    width: containerAnimation == true
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              MediaQuery.of(context).size.width / 3),
                          bottomRight: Radius.circular(
                              MediaQuery.of(context).size.width / 3)),
                      color: containerAnimation == true
                          ? kPrimaryColor
                          : kSecondaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    duration: Duration(
                      seconds: 5,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 2),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 2)),
                  child: AnimatedContainer(
                    duration: Duration(
                      seconds: 5,
                    ),
                    height: containerAnimation
                        ? MediaQuery.of(context).size.width
                        : MediaQuery.of(context).size.width / 1.5,
                    width: containerAnimation
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                              MediaQuery.of(context).size.width / 2),
                          topLeft: Radius.circular(
                              MediaQuery.of(context).size.width / 2)),
                      color:
                          containerAnimation ? kPrimaryColor1 : kSecondaryColor,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.only(
                    topRight:
                        Radius.circular(MediaQuery.of(context).size.width / 3),
                    bottomRight:
                        Radius.circular(MediaQuery.of(context).size.width / 3),
                  ),
                  child: AnimatedContainer(
                    duration: Duration(
                      seconds: 5,
                    ),
                    height: containerAnimation == false
                        ? MediaQuery.of(context).size.width / 1.5
                        : MediaQuery.of(context).size.width / 2,
                    width: containerAnimation == false
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              MediaQuery.of(context).size.width / 3),
                          bottomRight: Radius.circular(
                              MediaQuery.of(context).size.width / 3)),
                      color: containerAnimation
                          ? kSecondaryColor
                          : kSecondaryColor1,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/Images/logo.png"),
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    "ExchangeXpert",
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: kSubSecondaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          shadowColor: kSecondaryColor1,
                          backgroundColor: kSubPrimaryColor,
                        ),
                        child: const Text(
                          "€",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSubSecondaryColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          shadowColor: kSecondaryColor1,
                          backgroundColor: kSubPrimaryColor,
                        ),
                        child: const Text(
                          " £",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSubSecondaryColor,
                          ),
                        ),
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
                          shadowColor: kSecondaryColor1,
                          backgroundColor: kSubPrimaryColor,
                        ),
                        child: const Text(
                          "¥",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSubSecondaryColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          shadowColor: kSecondaryColor1,
                          backgroundColor: kSubPrimaryColor,
                        ),
                        child: const Text(
                          "₹",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSubSecondaryColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          shadowColor: kSecondaryColor1,
                          backgroundColor: kSubPrimaryColor,
                        ),
                        child: const Text(
                          " د.إ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: kSubSecondaryColor,
                          ),
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
    );
  }
}
