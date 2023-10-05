import 'dart:ui';

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.tragetValue,
    required this.bottom,
    required this.currency,
    required this.symbol,
  });

  final String currency;
  final String symbol;
  final bool bottom;
  final String tragetValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.96,
          decoration: BoxDecoration(
            // color: appTheme.colorScheme.secondary,
            color: lPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: !bottom
                        ? [
                            Row(
                              children: [
                                Text(
                                  currency,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: lSecondaryColor),
                                ),
                                const Spacer(),
                                Text(countryCodes[currency]!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: lSecondaryColor)),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("1 $symbol",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: lSecondaryColor)),
                            ),
                          ]
                        : [
                            Row(
                              children: [
                                Text(
                                  currency,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: lSecondaryColor),
                                ),
                                const Spacer(),
                                Text(countryCodes[currency]!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        color: lSecondaryColor)),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("$tragetValue $symbol",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w400,
                                      color: lSecondaryColor)),
                            ),
                          ].reversed.toList(),
                  ),
                )),
          )),
    );
  }
}
