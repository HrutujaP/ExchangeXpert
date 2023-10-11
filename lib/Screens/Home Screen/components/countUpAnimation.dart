import 'package:exchange_xpert/main.dart';
import 'package:flutter/material.dart';

class CountUpAnimation extends StatefulWidget {
  final double targetNumber;
  final Duration duration;

  const CountUpAnimation({required this.targetNumber, required this.duration});

  @override
  _CountUpAnimationState createState() => _CountUpAnimationState();
}

class _CountUpAnimationState extends State<CountUpAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation =
        Tween<double>(begin: 0, end: widget.targetNumber).animate(_controller)
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _animation.value.toStringAsFixed(2), // Display with two decimal places
      style: TextStyle(
          color: appTheme.colorScheme.surface,
          fontSize: 21,
          fontWeight: FontWeight.w900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
