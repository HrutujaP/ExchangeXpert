// ignore_for_file: file_names, camel_case_types

import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

class welcomeText extends StatelessWidget {
  const welcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        top: 18,
        bottom: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: appTheme.colorScheme.surface,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Let's get started!",
            style: TextStyle(
              color: appTheme.colorScheme.surface,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
