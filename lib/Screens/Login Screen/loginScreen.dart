// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/homeScreen.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/OTPVerification.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/currencyIconsDisplay.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginAppInfo.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/loginFormFields.dart';
import 'package:exchange_xpert/Screens/Login%20Screen/Components/welcomeText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
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
              const welcomeText(),
              loginFormFields(
                formKey: _signUpformKey,
                hintText: "Enter your Name",
                labelText: "Username",
                prefixIcon: const Icon(
                  Icons.abc,
                  color: kPrimaryColor1,
                ),
                name: 'username',
                controller: username_controller,
              ),
              loginFormFields(
                formKey: _signUpformKey,
                hintText: "Enter your Mobile Number",
                labelText: "Mobile Number",
                prefixIcon: const Icon(
                  Icons.phone,
                  color: kPrimaryColor1,
                ),
                name: 'mobileNumber',
                controller: mobileNumber_controller,
              ),
              Center(
                child: SizedBox(
                  width: 200,
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
                            print(e.message);
                          },
                          codeSent:
                              (String verificationId, int? resendToken) async {
                            var sms = SmsAutoFill().listenForCode;
                            OTPVerification(context, verificationId, "signUp",
                                mobileNumber, sms, username);
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            print(verificationId);
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        kSubSecondaryColor,
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        color: kSubPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "or",
                  style: TextStyle(
                      color: kPrimaryColor1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var credential = await signInWithGoogle();
                  String userEmail = credential.user!.email!;
                  FirebaseAuth.instance.authStateChanges().listen(
                    (User? user) {
                      if (user == null) {
                        Navigator.pushNamed(context, LoginScreen.id);
                      } else {
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(userEmail)
                            .set({"Email": userEmail});
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    },
                  );
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSubPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Continue with",
                          style: TextStyle(
                            color: kSubSecondaryColor,
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
                  child: const Text(
                    "Already have an account? Sign In.",
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
              const welcomeText(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: loginFormFields(
                  formKey: _signUpformKey,
                  hintText: "Enter your Mobile Number",
                  labelText: "Mobile Number",
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: kPrimaryColor1,
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
                      setState(() {
                        // username = username_controller.text;
                        mobileNumber = mobileNumber_controller.text;
                      });
                      if (_signInformKey.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(mobileNumber)
                            .get()
                            .then((value) async {
                          if (value.exists) {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+91$mobileNumber",
                              verificationCompleted:
                                  (PhoneAuthCredential credential) async {
                                pinController.setText(credential.smsCode!);
                              },
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent: (String verificationId,
                                  int? resendToken) async {
                                var sms = SmsAutoFill().listenForCode;
                                OTPVerification(context, verificationId,
                                    "signin", mobileNumber, sms, "");
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          } else {
                            userNotFoundPopUp(context);
                          }
                        });
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        kSubSecondaryColor,
                      ),
                    ),
                    child: const Text(
                      "Send OTP to Sign In",
                      style: TextStyle(
                        color: kSubPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "or",
                  style: TextStyle(
                      color: kPrimaryColor1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var credential = await signInWithGoogle();
                  String userEmail = credential.user!.email!;
                  FirebaseFirestore.instance
                      .collection("Users")
                      .doc(userEmail)
                      .get()
                      .then((value) {
                    if (value.exists) {
                      // Navigator.pushNamed(context, HomeScreen.id);
                      FirebaseAuth.instance.authStateChanges().listen(
                        (User? user) {
                          if (user == null) {
                            userNotFoundPopUp(context);
                          } else {
                            Navigator.pushNamed(context, HomeScreen.id);
                          }
                        },
                      );
                    } else {
                      userNotFoundPopUp(context);
                    }
                  });
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSubPrimaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Continue with",
                          style: TextStyle(
                            color: kSubSecondaryColor,
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
                    buttonCarouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                  child: const Text("Don't have an account Sign Up",
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
    );
  }

  Future<dynamic> userNotFoundPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: const Text(
              'User not found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kSubSecondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 10,
            shadowColor: kSecondaryColor1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: kSubPrimaryColor,
            contentPadding: const EdgeInsets.all(0),
            titlePadding: const EdgeInsets.all(15),
          );
        });
  }
}
