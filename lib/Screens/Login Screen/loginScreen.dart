import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool containerAnimation = false;
  bool _isHidden = true;
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          containerAnimation = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // appInfo(),
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
                                Radius.circular(130),
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(
                                  seconds: 5,
                                ),
                                height: 130,
                                width: 130,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(130),
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
              Column(
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
                          surfaceTintColor: kSecondaryColor1,
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
                          surfaceTintColor: kSecondaryColor1,
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
                          surfaceTintColor: kSecondaryColor1,
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
                          surfaceTintColor: kSecondaryColor1,
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
                          surfaceTintColor: kSecondaryColor1,
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

              CarouselSlider(
                items: [
                  AnimatedOpacity(
                    opacity: containerAnimation == false ? 0 : 1,
                    duration: const Duration(
                      seconds: 5,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                color: kSubSecondaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              "Let's get started!",
                              style: TextStyle(
                                color: kSubSecondaryColor,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                cursorColor: kPrimaryColor1,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize: 18,
                                ),
                                decoration: kTextFieldDecoration.copyWith(
                                  fillColor: kSubPrimaryColor.withOpacity(0.2),
                                  hintText: "Enter your phone number",
                                  labelText: "Mobile Number",
                                  labelStyle: const TextStyle(
                                    color: kSubSecondaryColor,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: kPrimaryColor1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                cursorColor: kPrimaryColor1,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize: 18,
                                ),
                                decoration: kTextFieldDecoration.copyWith(
                                  fillColor: kSubPrimaryColor.withOpacity(0.2),
                                  hintText: "Enter your password",
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    color: kSubSecondaryColor,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: kPrimaryColor1,
                                  ),
                                  suffixIcon: InkWell(
                                    radius: BorderSide.strokeAlignCenter,
                                    onTap: () {
                                      setState(() {
                                        _isHidden = !_isHidden;
                                      });
                                    },
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kPrimaryColor1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?",
                                style: TextStyle(
                                  color: kPrimaryColor1,
                                )),
                          ),
                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    kSubSecondaryColor,
                                  ),
                                ),
                                child: const Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: kSubPrimaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                buttonCarouselController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: const Text("Sign Up",
                                  style: TextStyle(
                                    color: kPrimaryColor1,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: containerAnimation == false ? 0 : 1,
                    duration: const Duration(
                      seconds: 5,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                color: kSubSecondaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              "Let's get started!",
                              style: TextStyle(
                                color: kSubSecondaryColor,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                cursorColor: kPrimaryColor1,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize: 18,
                                ),
                                decoration: kTextFieldDecoration.copyWith(
                                  fillColor: kSubPrimaryColor.withOpacity(0.2),
                                  hintText: "Enter your Name",
                                  labelText: "Full Name",
                                  labelStyle: const TextStyle(
                                    color: kSubSecondaryColor,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.abc,
                                    color: kPrimaryColor1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                cursorColor: kPrimaryColor1,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize: 18,
                                ),
                                decoration: kTextFieldDecoration.copyWith(
                                  fillColor: kSubPrimaryColor.withOpacity(0.2),
                                  hintText: "Enter your phone number",
                                  labelText: "Mobile Number",
                                  labelStyle: const TextStyle(
                                    color: kSubSecondaryColor,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: kPrimaryColor1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 60,
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: TextField(
                                cursorColor: kPrimaryColor1,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                  color: kSecondaryColor1,
                                  fontSize: 18,
                                ),
                                decoration: kTextFieldDecoration.copyWith(
                                  fillColor: kSubPrimaryColor.withOpacity(0.2),
                                  hintText: "Enter your password",
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    color: kSubSecondaryColor,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: kPrimaryColor1,
                                  ),
                                  suffixIcon: InkWell(
                                    radius: BorderSide.strokeAlignCenter,
                                    onTap: () {
                                      setState(() {
                                        _isHidden = !_isHidden;
                                      });
                                    },
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kPrimaryColor1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // TextButton(
                          //   onPressed: () {},
                          //   child: const Text("Forgot Password?",
                          //       style: TextStyle(
                          //         color: kPrimaryColor1,
                          //       )),
                          // ),

                          Center(
                            child: SizedBox(
                              width: 200,
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  buttonCarouselController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    kSubSecondaryColor,
                                  ),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: kSubPrimaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                buttonCarouselController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: kPrimaryColor1,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.5,
                  scrollPhysics: const BouncingScrollPhysics(),
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
