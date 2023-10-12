// ignore_for_file: camel_case_types, file_names

import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

class loginAppInfo extends StatelessWidget {
  const loginAppInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
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
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(130),
                          ),
                          color: appTheme.colorScheme.primary,
                          shape: BoxShape.rectangle,
                        ),
                      )),
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/Images/logo.png"),
                    height: 140,
                    width: 140,
                  ),
                ),
              ],
            ),
            Text(
              "ExchangeXpert",
              style: TextStyle(
                fontSize: 28,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: appTheme.colorScheme.surface,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
