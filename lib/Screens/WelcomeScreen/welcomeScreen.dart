import 'dart:async';

import 'package:exchange_xpert/Components/AppInfo.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/loginScreen.dart';
import 'package:flutter/material.dart';

bool _isVisible = true;

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
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        containerAnimation = !containerAnimation;
        // _isVisible = !_isVisible;
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
            // Navigator.push(context, _createRoute());
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Stack(
            children: [
              Visibility(
                visible: _isVisible,
                replacement: const Center(),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
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
                        // color: containerAnimation == true
                        //     ? kPrimaryColor
                        //     : kSecondaryColor,
                        color: kLightThemeColor,
                        shape: BoxShape.rectangle,
                      ),
                      duration: const Duration(
                        seconds: 5,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: _isVisible,
                  replacement: const Center(),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            MediaQuery.of(context).size.width / 2),
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width / 2)),
                    child: AnimatedContainer(
                      duration: const Duration(
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
                        // color: containerAnimation
                        //     ? kPrimaryColor1
                        //     : kSecondaryColor,
                        color: kLightThemeColor,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                  visible: _isVisible,
                  replacement: const Center(),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                    ),
                    child: AnimatedContainer(
                      duration: const Duration(
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
                        // color: containerAnimation
                        //     ? kSecondaryColor
                        //     : kSecondaryColor1,
                        color: kLightThemeColor,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),

              appInfo(
                isVisible: _isVisible,
              ),
              // const Login(),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}