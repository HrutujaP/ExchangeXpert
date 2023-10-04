import 'package:exchange_xpert/Constants/constant.dart';
import 'package:flutter/material.dart';

class currencyIconsDisplay extends StatelessWidget {
  const currencyIconsDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                shadowColor: DarkThemeColor,
                backgroundColor: LightThemeColor,
                surfaceTintColor: lSecondaryColor1,
                elevation: 10,
              ),
              child: const Text(
                "€",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lSubSecondaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                shadowColor: DarkThemeColor,
                backgroundColor: LightThemeColor,
                surfaceTintColor: lSecondaryColor1,
                elevation: 10,
              ),
              child: const Text(
                " £",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lSubSecondaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                shadowColor: DarkThemeColor,
                backgroundColor: LightThemeColor,
                surfaceTintColor: lSecondaryColor1,
                elevation: 10,
              ),
              child: const Text(
                "¥",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lSubSecondaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                shadowColor: DarkThemeColor,
                backgroundColor: LightThemeColor,
                surfaceTintColor: lSecondaryColor1,
                elevation: 10,
              ),
              child: const Text(
                "₹",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lSubSecondaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                shadowColor: DarkThemeColor,
                foregroundColor: LightThemeColor,
                backgroundColor: LightThemeColor,
                surfaceTintColor: lSecondaryColor1,
                elevation: 10,
              ),
              child: Text(
                " د.إ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: lSubSecondaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
