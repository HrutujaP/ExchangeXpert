import 'package:exchange_xpert/Screens/Home%20Screen/components/chart.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import '../../Constants/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = "homeScreen";
  User user;
  HomeScreen({required this.user, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Functions functions = Functions();

  String base = "AED";
  String target = "INR";

  bool isAnimating = false;

  void changeBase(String value) {
    setState(() {
      base = value;
      isAnimating = false;
    });
  }

  void changeTarget(String value) {
    setState(() {
      target = value;
      isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColor,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            "👋 ${widget.user.displayName.toString().split(" ")[0]}",
                            style: const TextStyle(
                                color: lPrimaryColor1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      const Text(
                        "Convert",
                        style: TextStyle(
                            letterSpacing: 3,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      Spacer(),
                      const Expanded(child: Icon(Icons.menu)),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: lSubSecondaryColor.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                        color: lSecondaryColor
                            .withOpacity(0.1) // Set the background color
                        ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "From",
                            style: TextStyle(
                              color: lSubSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          CurrencyMenu(
                            changeCurrency: changeBase,
                          ),
                          const Divider(
                            color: Colors.transparent,
                            thickness: 1,
                            indent: 50,
                            endIndent: 50,
                          ),
                          const Text(
                            "To",
                            style: TextStyle(
                              color: lSubSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          CurrencyMenu(
                            changeCurrency: changeTarget,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Visibility(
                      visible: isAnimating,
                      replacement: Lottie.asset(
                        'assets/animations/money-receive.json',
                        height: 200,
                        width: 200,
                        repeat: true,
                        reverse: true,
                      ),
                      child: FutureBuilder(
                        future: functions.getConversionRate(base, target),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return AnimatedOpacity(
                            opacity: !isAnimating ? 0 : 1,
                            duration: const Duration(seconds: 5),
                            child: Chart(
                              spots: snapshot.data!,
                              reload: () {
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: base.isNotEmpty && target.isNotEmpty,
                    replacement: base.isEmpty
                        ? const Text(
                            "Select Base Currency",
                            style: TextStyle(
                              color: lSubSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        : const Text(
                            "Select Target Currency",
                            style: TextStyle(
                              color: lSubSecondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                    child: TextButton(
                      isSemanticButton: true,
                      autofocus: true,
                      onPressed: () {
                        setState(() {
                          isAnimating = true;
                        });
                      },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(10),
                          shadowColor: MaterialStateColor.resolveWith(
                              (states) => lSubSecondaryColor),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10)),
                          backgroundColor:
                              MaterialStateProperty.all(lSubPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                      child: Text(
                        "Convert $base to $target",
                        style: const TextStyle(
                            color: lSubSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

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
          dropdownColor: LightThemeColor,
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
                    style: const TextStyle(
                      color: lSubSecondaryColor,
                      fontSize: 16,
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

class CustomPainterContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = DarkThemeColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1666667, size.height * 0.0714286);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.0714286);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.2142857);
    path_0.lineTo(size.width * 0.3958333, size.height * 0.2142857);
    path_0.quadraticBezierTo(size.width * 0.3943750, size.height * 0.1803571,
        size.width * 0.3750000, size.height * 0.1785714);
    path_0.quadraticBezierTo(size.width * 0.3547917, size.height * 0.1803571,
        size.width * 0.3541667, size.height * 0.2142857);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.2142857);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.0714286);

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    Paint paintStroke0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
