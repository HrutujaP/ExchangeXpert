// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class appInfo extends StatefulWidget {
  bool isVisible;
  appInfo({
    required this.isVisible,
  });

  @override
  State<appInfo> createState() => _appInfoState();
}

class _appInfoState extends State<appInfo> {
  bool _visible = true;
  bool containerAnimation = true;
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        containerAnimation = !containerAnimation;
        _visible = !_visible;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isVisible == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              )
            : Center(),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Material(
                        elevation: 10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(150),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(
                            seconds: 5,
                          ),
                          height: _visible == false ? 200 : 150,
                          width: _visible == false ? 200 : 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(150),
                            ),
                            color: kLightThemeColor,
                            shape: BoxShape.rectangle,
                          ),
                        )),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage("assets/Images/logo.png"),
                      height: 125,
                      width: 125,
                    ),
                  ),
                ],
              ),
              const Text(
                "ExchangeXpert",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  color: kSubSecondaryColor,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
        widget.isVisible == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              )
            : const Center(),
        // widget.isVisible == true
        //     ?
        SlideTransition(
          position: const AlwaysStoppedAnimation<Offset>(Offset(0.0, 0.0)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                        shadowColor: kDarkThemeColor,
                        backgroundColor: kLightThemeColor,
                        elevation: 10,
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
                        shadowColor: kDarkThemeColor,
                        backgroundColor: kLightThemeColor,
                        elevation: 10,
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
                        shadowColor: kDarkThemeColor,
                        backgroundColor: kLightThemeColor,
                        elevation: 10,
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
                        shadowColor: kDarkThemeColor,
                        backgroundColor: kLightThemeColor,
                        elevation: 10,
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
                        shadowColor: kDarkThemeColor,
                        foregroundColor: kLightThemeColor,
                        backgroundColor: kLightThemeColor,
                        elevation: 10,
                      ),
                      child: Text(
                        " د.إ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kSubSecondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
