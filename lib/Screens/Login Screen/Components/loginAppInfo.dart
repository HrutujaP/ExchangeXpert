import 'package:exchange_xpert/Constants/constant.dart';
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
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(130),
                          ),
                          color: LightThemeColor,
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
                color: lSubSecondaryColor,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
