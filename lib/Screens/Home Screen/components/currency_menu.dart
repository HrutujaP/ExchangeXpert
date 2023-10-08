// ignore_for_file: must_be_immutable

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

class CurrencyMenu extends StatefulWidget {
  Function changeCurrency;
  CurrencyMenu({
    required this.changeCurrency,
    super.key,
  });

  @override
  State<CurrencyMenu> createState() => _CurrencyMenuState();
}

class _CurrencyMenuState extends State<CurrencyMenu> {
  List<DropdownMenuItem<String>> items = [];

  String dropdownValue = "";

  @override
  void initState() {
    items = countryCodes
        .map((key, value) => MapEntry(
            key,
            DropdownMenuItem<String>(
              value: "$value-$key",
              child: Text(value),
            )))
        .values
        .toList();
    dropdownValue = items[0].value.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: LightThemeColor.withOpacity(0.9), // Set the background color
      ),
      child: DropdownButton(
          elevation: 10,
          dropdownColor: appTheme.colorScheme.surface,
          underline: const SizedBox(),
          selectedItemBuilder: (context) {
            return items.map((item) {
              String currency =
                  item.value.toString().split("-")[1].toLowerCase();
              String country = currencyToCountry.containsKey(currency)
                  ? currencyToCountry[currency]!
                  : "in";
              Image image = Image.asset(
                "assets/Images/CountryFlags/$country.png",
                fit: BoxFit.cover,
                height: 25,
                width: 35,
                filterQuality: FilterQuality.high,
              );
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: image,
                  ),
                  Text(
                    item.value.toString(),
                    style: TextStyle(
                      color: lSubSecondaryColor,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              );
            }).toList();
          },
          value: dropdownValue,
          hint: const Text(
            "Select Currency",
            style: TextStyle(
              color: lSubSecondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          items: items,
          onChanged: (value) {
            setState(() {
              dropdownValue = value.toString();
              widget.changeCurrency(value.toString().split('-')[1]);
            });
          }),
    );
  }
}
