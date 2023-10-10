// ignore_for_file: must_be_immutable, camel_case_types

import 'package:exchange_xpert/Constants/constant.dart';
import 'package:exchange_xpert/main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  List<FlSpot> spots;
  Chart({required this.spots, super.key});

  @override
  State<Chart> createState() => _chartState();
}

class _chartState extends State<Chart> with SingleTickerProviderStateMixin {
  List<Color> gradientColors = [
    appTheme.colorScheme.background,
    appTheme.colorScheme.primary,
  ];

  double avgDiffY = 0.0;
  double diffSumY = 0.0;

  @override
  void initState() {
    for (int i = 0; i < widget.spots.length - 1; i++) {
      diffSumY += (widget.spots[i].y - widget.spots[i + 1].y).abs();
    }
    avgDiffY = diffSumY / (widget.spots.length - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 55,
          bottom: 0,
        ),
        child: LineChart(
          mainData(),
          // duration: const Duration(milliseconds: 2000),
          // chartRendererKey: const ObjectKey("chart"),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      color: appTheme.colorScheme.primary,
      fontSize: 12,
    );

    return SideTitleWidget(
      // foramt like 8-Oct
      axisSide: meta.axisSide,
      child: Text(
          "${DateTime.now().subtract(Duration(days: value.toInt())).day}-${DateFormat.MMM().format(DateTime.now().subtract(Duration(days: value.toInt())))}",
          style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      fontWeight: FontWeight.bold,
      color: appTheme.colorScheme.primary,
      fontSize: 10,
    );

    return Text((value / 100).toStringAsFixed(2),
        style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: avgDiffY == 0 ? 1 : avgDiffY,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: appTheme.colorScheme.primary.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: appTheme.colorScheme.primary.withOpacity(0.5),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: avgDiffY == 0 ? 1 : avgDiffY,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: appTheme.colorScheme.primary, width: 1),
      ),
      minX: widget.spots
          .map((e) => e.x)
          .reduce((value, element) => value < element ? value : element),
      maxX: widget.spots
          .map((e) => e.x)
          .reduce((value, element) => value > element ? value : element),
      minY: (widget.spots
          .map((e) => e.y)
          .reduce((value, element) => value < element ? value : element)),
      maxY: (widget.spots
          .map((e) => e.y)
          .reduce((value, element) => value > element ? value : element)),
      lineBarsData: [
        LineChartBarData(
          spots: widget.spots,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
