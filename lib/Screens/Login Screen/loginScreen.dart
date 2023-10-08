// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
// import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/homeScreen.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/OTPVerification.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginAppInfo.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginFormFields.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/welcomeText.dart';
import 'package:exchange_xpert/Screens/Welcome%20Screen/Components/currenyIcons.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

String username = "";
String mobileNumber = "";

final username_controller = TextEditingController();
final mobileNumber_controller = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserCredential userCredential;
  bool _lightThemeSelected = false;

  bool containerAnimation = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final _signUpformKey = GlobalKey<FormState>();
  final _signInformKey = GlobalKey<FormState>();
  CarouselController buttonCarouselController = CarouselController();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void initState() {
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
    return Theme(
      data: appTheme,
      child: Scaffold(
        backgroundColor: appTheme.colorScheme.background,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                // appInfo(),
                const loginAppInfo(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        currencyIcons(
                          currency: "€",
                        ),
                        currencyIcons(
                          currency: "£",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        currencyIcons(
                          currency: "¥",
                        ),
                        currencyIcons(
                          currency: "₹",
                        ),
                        currencyIcons(
                          currency: "د.إ",
                        ),
                      ],
                    ),
                  ],
                ),

                CarouselSlider(
                  items: [
                    signIn(context),
                    signUp(context),
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form signUp(BuildContext context) {
    return Form(
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
              Row(
                children: [
                  const welcomeText(),
                  const Spacer(),
                  _lightThemeSelected == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              MyApp.setTheme(context, DarkTheme);
                              _lightThemeSelected = true;
                            });
                          },
                          icon: Icon(
                            Icons.bedtime,
                            color: appTheme.colorScheme.primary,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              MyApp.setTheme(context, LightTheme);
                              _lightThemeSelected = false;
                            });
                          },
                          icon: Icon(
                            Icons.sunny,
                            color: appTheme.colorScheme.primary,
                            size: 30,
                          ),
                        ),
                ],
              ),
              loginFormFields(
                formKey: _signUpformKey,
                hintText: "Enter your Name",
                labelText: "Username",
                prefixIcon: Icon(
                  Icons.abc,
                  size: 30,
                  color: appTheme.colorScheme.onBackground,
                ),
                name: 'username',
                controller: username_controller,
              ),
              loginFormFields(
                formKey: _signUpformKey,
                hintText: "Enter your Mobile Number",
                labelText: "Mobile Number",
                prefixIcon: Icon(
                  Icons.phone,
                  size: 27,
                  color: appTheme.colorScheme.onBackground,
                ),
                name: 'mobileNumber',
                controller: mobileNumber_controller,
              ),
              Center(
                child: SizedBox(
                  // width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        username = username_controller.text;
                        mobileNumber = mobileNumber_controller.text;
                      });
                      if (_signUpformKey.currentState!.validate()) {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+91$mobileNumber",
                          verificationCompleted:
                              (PhoneAuthCredential credential) async {
                            pinController.setText(credential.smsCode!);
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            // print(e.message);
                          },
                          codeSent:
                              (String verificationId, int? resendToken) async {
                            var sms = SmsAutoFill().listenForCode;
                            OTPVerification(context, verificationId, "signUp",
                                mobileNumber, sms, username);
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            // print(verificationId);
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        appTheme.colorScheme.surface,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Request OTP",
                        style: TextStyle(
                          color: appTheme.colorScheme.onSurface,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: appTheme.colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var credential = await signInWithGoogle();
                  String userEmail = credential.user!.email!;
                  DocumentSnapshot documentSnapshot = await FirebaseFirestore
                      .instance
                      .collection('Users')
                      .doc(userEmail)
                      .get();

                  if (!documentSnapshot.exists) {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(userEmail)
                        .set({
                      "Email": userEmail,
                      "Name": credential.user!.displayName
                    });
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                          user: credential.user!,
                        );
                      },
                    ));
                  }
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appTheme.colorScheme.onBackground.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with",
                          style: TextStyle(
                            color: appTheme.colorScheme.surface,
                            fontSize: 20,
                          ),
                        ),
                        Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover,
                          scale: 35,
                        ),
                      ],
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
                  child: Text(
                    "Already have an account? Sign In.",
                    style: TextStyle(
                      color: appTheme.colorScheme.surface,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form signIn(BuildContext context) {
    return Form(
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
              Row(
                children: [
                  const welcomeText(),
                  Spacer(),
                  _lightThemeSelected == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              MyApp.setTheme(context, DarkTheme);
                              _lightThemeSelected = true;
                            });
                          },
                          icon: Icon(
                            Icons.bedtime,
                            color: appTheme.colorScheme.primary,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              MyApp.setTheme(context, LightTheme);
                              _lightThemeSelected = false;
                            });
                          },
                          icon: Icon(
                            Icons.sunny,
                            color: appTheme.colorScheme.primary,
                            size: 30,
                          ),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: loginFormFields(
                  formKey: _signUpformKey,
                  hintText: "Enter your Mobile Number",
                  labelText: "Mobile Number",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: appTheme.colorScheme.onBackground,
                  ),
                  name: 'mobileNumber',
                  controller: mobileNumber_controller,
                ),
              ),
              Center(
                child: SizedBox(
                  // width: 0,
                  // height: 50,
                  child: TextButton(
                    onPressed: () async {
                      mobileNumber = mobileNumber_controller.text;
                      DocumentSnapshot documentSnapshot =
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(mobileNumber)
                              .get();
                      if (documentSnapshot.exists) {
                        if (_signInformKey.currentState!.validate()) {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: "+91$mobileNumber",
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              pinController.setText(credential.smsCode!);
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print(e.message);
                            },
                            codeSent: (String verificationId,
                                int? resendToken) async {
                              var sms = SmsAutoFill().listenForCode;
                              OTPVerification(context, verificationId, "signin",
                                  mobileNumber, sms, "");
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              print(verificationId);
                            },
                          );
                        }
                      } else {
                        userNotFoundPopUp(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        appTheme.colorScheme.surface,
                      ),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Request OTP",
                        style: TextStyle(
                          color: appTheme.colorScheme.onSurface,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: appTheme.colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  UserCredential credential = await signInWithGoogle();
                  String userEmail = credential.user!.email!;
                  DocumentSnapshot documentSnapshot = await FirebaseFirestore
                      .instance
                      .collection('Users')
                      .doc(userEmail)
                      .get();

                  if (!documentSnapshot.exists) {
                    userNotFoundPopUp(context);
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                          user: credential.user!,
                        );
                      },
                    ));
                  }
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appTheme.colorScheme.secondary.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with",
                          style: TextStyle(
                            color: appTheme.colorScheme.surface,
                            fontSize: 20,
                          ),
                        ),
                        Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover,
                          scale: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(
                        color: appTheme.colorScheme.primary,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> userNotFoundPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'User not found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appTheme.colorScheme.surface,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 10,
            shadowColor: appTheme.colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: appTheme.colorScheme.background,
            contentPadding: const EdgeInsets.all(0),
            titlePadding: const EdgeInsets.all(15),
          );
        });
  }
}
