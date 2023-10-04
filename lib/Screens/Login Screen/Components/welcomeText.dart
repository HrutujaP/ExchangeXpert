import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class welcomeText extends StatelessWidget {
  const welcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: lSubSecondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Let's get started!",
            style: TextStyle(
              color: lSubSecondaryColor,
              fontSize: 18,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
