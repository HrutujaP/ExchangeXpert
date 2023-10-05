// ignore_for_file: must_be_immutable

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

class currencyIcons extends StatelessWidget {
  String currency;
  currencyIcons({
    required this.currency,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        shadowColor: DarkThemeColor,
        backgroundColor: appTheme.colorScheme.surface,
        surfaceTintColor: lSecondaryColor1,
        elevation: 10,
      ),
      child: Text(
        currency,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: appTheme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
