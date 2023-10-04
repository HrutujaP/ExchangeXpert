// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/homeScreen.dart';
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
    border: Border.all(color: kDarkThemeColor),
  ),
);
Future<dynamic> OTPVerification(BuildContext context, String verificationId,
    String requestType, String mobileNumber, var pin, String name) {
    
    UserCredential user;

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kSubPrimaryColor,
          contentPadding: EdgeInsets.all(0),
          title: const Center(
            child: Text(
              "Enter OTP",
              style: TextStyle(
                  color: kSecondaryColor1,
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
                            color: kDarkThemeColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kSecondaryColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: kPrimaryColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.red),
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
                     user =  await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      if (requestType != "sign-in") {
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(user.user!.displayName)
                            .set({"Mobile Number": mobileNumber, "Name": name});
                      }

                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen(user: user.user!,);
                        },
                      ));
                    },
                    child: const Text(
                      "VERIFY",
                      style: TextStyle(
                        color: kPrimaryColor1,
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
