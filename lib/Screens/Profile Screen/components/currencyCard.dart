import 'dart:ui';

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/main.dart';
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
          // height: 100,
          width: MediaQuery.of(context).size.width * 0.96,
          decoration: BoxDecoration(
            // color: appTheme.colorScheme.secondary,
            color: appTheme.colorScheme.secondary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.w600,
                                    color: appTheme.colorScheme.surface,
                                  ),
                                ),
                                const Spacer(),
                                Text(countryCodes[currency]!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.w600,
                                      color: appTheme.colorScheme.surface,
                                    )),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "₹ 1",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: appTheme.colorScheme.surface,
                              ),
                            ),
                          ]
                        : [
                            Row(
                              children: [
                                Text(
                                  currency,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.w600,
                                    color: appTheme.colorScheme.surface,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  countryCodes[currency]!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.w600,
                                    color: appTheme.colorScheme.surface,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text("£ $tragetValue",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: appTheme.colorScheme.surface,
                                )),
                          ].reversed.toList(),
                  ),
                )),
          )),
    );
  }
}
