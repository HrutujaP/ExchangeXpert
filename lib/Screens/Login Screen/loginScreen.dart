import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/OTPVerification.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/currencyIconsDisplay.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginAppInfo.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginFormFields.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/welcomeText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool containerAnimation = false;
  bool _isHidden = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  final _signUpformKey = GlobalKey<FormState>();
  final _signInformKey = GlobalKey<FormState>();
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // appInfo(),
              const loginAppInfo(),
              const currencyIconsDisplay(),
              CarouselSlider(
                items: [
                  Form(
                    key: _signInformKey,
                    child: AnimatedOpacity(
                      opacity: containerAnimation == false ? 0 : 1,
                      duration: const Duration(
                        seconds: 2,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const welcomeText(),
                            loginFormFields(
                              formKey: _signUpformKey,
                              hintText: "Enter your Mobile Number",
                              labelText: "Mobile Number",
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: kPrimaryColor1,
                              ),
                            ),
                            loginFormFields(
                              formKey: _signInformKey,
                              hintText: "Enter your Password",
                              labelText: "Password",
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
                                  onPressed: () {
                                    if (_signInformKey.currentState!
                                        .validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
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
                                      duration:
                                          const Duration(milliseconds: 300),
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
                  ),
                  Form(
                    key: _signUpformKey,
                    child: AnimatedOpacity(
                      opacity: containerAnimation == false ? 0 : 1,
                      duration: const Duration(
                        seconds: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const welcomeText(),
                            loginFormFields(
                              formKey: _signUpformKey,
                              hintText: "Enter your Name",
                              labelText: "Username",
                              prefixIcon: const Icon(
                                Icons.abc,
                                color: kPrimaryColor1,
                              ),
                            ),
                            loginFormFields(
                              formKey: _signUpformKey,
                              hintText: "Enter your Mobile Number",
                              labelText: "Mobile Number",
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: kPrimaryColor1,
                              ),
                            ),
                            loginFormFields(
                              formKey: _signUpformKey,
                              hintText: "Enter your Password",
                              labelText: "Password",
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
                            Center(
                              child: SizedBox(
                                width: 200,
                                height: 50,
                                child: TextButton(
                                  onPressed: () async {
                                    // buttonCarouselController.nextPage(
                                    //     duration:
                                    //         const Duration(milliseconds: 300),
                                    //     curve: Curves.linear);

                                    // await FirebaseAuth.instance
                                    //     .verifyPhoneNumber(
                                    //   phoneNumber: '+916361125470',
                                    //   verificationCompleted:
                                    //       (PhoneAuthCredential
                                    //           credential) async {},
                                    //   verificationFailed:
                                    //       (FirebaseAuthException e) {},
                                    //   codeSent: (String verificationId,
                                    //       int? resendToken) async {
                                    //     // OTPVerification(
                                    //     //     context, verificationId);
                                    //   },
                                    //   codeAutoRetrievalTimeout:
                                    //       (String verificationId) {},
                                    // );
                                    if (_signUpformKey.currentState!
                                        .validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      kSubSecondaryColor,
                                    ),
                                  ),
                                  child: const Text(
                                    "Request OTP",
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
                                      duration:
                                          const Duration(milliseconds: 300),
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
