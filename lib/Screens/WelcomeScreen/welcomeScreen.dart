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
    Timer.periodic(Duration(seconds: 5), (timer) {
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
                replacement: Center(),
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
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: _isVisible,
                  replacement: Center(),
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
                        color: containerAnimation
                            ? kPrimaryColor1
                            : kSecondaryColor,
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
                  replacement: Center(),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width / 3),
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
              ),
              Column(
                mainAxisAlignment: _isVisible == true
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  appInfo(),
                  _isVisible == false
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Welcome",
                              ),
                              Text(
                                "Let's get started!",
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    labelText: 'Mobile Number',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Send Otp"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("Validate"),
                              ),
                              Text(
                                "or",
                              ),
                              Text(
                                "Continue with",
                              ),
                            ],
                          ),
                        )
                      : Center(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class appInfo extends StatelessWidget {
  const appInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: _isVisible == true
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("assets/Images/logo.png"),
          height: 125,
          width: 125,
        ),
        Text(
          "ExchangeXpert",
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: kSubSecondaryColor,
            decoration: TextDecoration.none,
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
