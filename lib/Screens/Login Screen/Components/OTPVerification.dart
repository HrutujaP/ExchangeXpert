// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/homeScreen.dart';
import 'package:exchange_xpert/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final pinController = TextEditingController();
final focusNode = FocusNode();
final defaultPinTheme = PinTheme(
  width: 45,
  height: 45,
  textStyle: const TextStyle(
    fontSize: 22,
    color: Color.fromRGBO(30, 60, 87, 1),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(19),
    border: Border.all(color: DarkThemeColor),
  ),
);
Future<dynamic> OTPVerification(BuildContext context, String verificationId,
    String requestType, String mobileNumber, var pin, String name) {
  UserCredential user;

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: appTheme.colorScheme.onSurface,
          contentPadding: EdgeInsets.all(0),
          title: Center(
            child: Text(
              "Enter OTP",
              style: TextStyle(
                  color: appTheme.colorScheme.onSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      length: 6,
                      // hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        // debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        // debugPrint('onChanged: $value');
                      },

                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: DarkThemeColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: appTheme.colorScheme.secondary,
                          ),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: appTheme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(
                            color: appTheme.colorScheme.primary,
                          ),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: appTheme.colorScheme.error),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: pinController.text,
                      );
                      user = await FirebaseAuth.instance
                          .signInWithCredential(credential);

                      if (requestType != "signin") {
                        user.user!.updateDisplayName(name);
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(mobileNumber)
                            .set({"Mobile Number": mobileNumber, "Name": name});
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen(
                              user: user.user!,
                            );
                          },
                        ));
                      } else {
                        print("Sign in");

                        final doc = await FirebaseFirestore.instance
                            .collection("Users")
                            .doc(mobileNumber)
                            .get()
                            .then((value) {
                          user.user!.updateDisplayName(value["Name"]);
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(
                                user: user.user!,
                              );
                            },
                          ));
                        });
                      }
                    },
                    child: Text(
                      "VERIFY",
                      style: TextStyle(
                        color: appTheme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
