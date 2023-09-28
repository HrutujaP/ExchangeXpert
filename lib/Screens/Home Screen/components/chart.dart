import 'package:exchange_xpert/Constants/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  List<FlSpot> spots;
  Function reload;
  Chart({required this.reload, required this.spots, super.key});

  @override
  State<Chart> createState() => _chartState();
}

class _chartState extends State<Chart> {
  List<Color> gradientColors = [kPrimaryColor, kSecondaryColor];

  bool showAvg = false;

  double avgDiffY = 0.0;
  double diffSumY = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.spots.length - 1; i++) {
      diffSumY += (widget.spots[i].y - widget.spots[i + 1].y).abs();
    }
    avgDiffY = diffSumY / (widget.spots.length - 1);
    // print(avgDiffY);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.3,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 55,
              bottom: 0,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Material(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              color: showAvg
                  ? kSecondaryColor.withOpacity(0.4)
                  : kPrimaryColor.withOpacity(0.4),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Text(
                  'Avg',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: kSubSecondaryColor),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            height: 50,
            child: TextButton(
              onPressed: () {
                widget.reload();
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(7),
                color: kSubPrimaryColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Icon(Icons.refresh, color: kSubSecondaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
          DateTime.now().subtract(Duration(days: value.toInt())).day.toString(),
          style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    return Text(value.toStringAsFixed(2),
        style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: avgDiffY,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: kPrimaryColor1,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: kSecondaryColor1,
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
            interval: avgDiffY,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
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
            show: false,
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

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: true),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: avgDiffY,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: avgDiffY,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
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
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
