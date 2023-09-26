import 'package:collection/collection.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/chart_controller.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/chart_point.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/dimensions.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/line_chart_painter.dart';
import 'package:exchange_xpert/Screens/Home%20Screen/components/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class LineChart extends StatefulWidget {
  final String xAxisLabel;
  final String yAxisLabel;
  final List<ChartPoint> points;
  final ChartController<ChartPoint>? controller;


  const LineChart({
    super.key,
    required this.xAxisLabel,
    required this.yAxisLabel,
    required this.points,
    this.controller,

  });

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late final ChartController<ChartPoint> _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? ChartController<ChartPoint>();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double chartWidth = constraints.maxWidth - Dimensions.tappable * 2.0;
        double chartHeight = constraints.maxHeight - Dimensions.regular - Dimensions.tappable;
        double xFactor = chartWidth / (widget.points.length - 1);
        double yFactor = chartHeight / widget.points.map((point) => point.y).max;

        return Stack(
          children: [
            _createChart(),
            for (int i = 0; i != widget.points.length; i++)
              Positioned(
                left: (xFactor.isInfinite ? chartWidth / 2.0 : i * xFactor) - Dimensions.tappable / 2.0 + Dimensions.tappable,
                top: constraints.maxHeight - widget.points[i].y * yFactor - Dimensions.tappable / 2.0 - Dimensions.tappable,
                child: _createPoint(widget.points[i]),
              ),
          ],
        );
      },
    );
  }

  Widget _createChart() {
    return Column(
      children: [
        const SizedBox(height: Dimensions.regular),
        Expanded(
          child: Row(
            children: [
              const SizedBox(width: Dimensions.regular),
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _createMinYAxisValue()),
                    Flexible(child: _createYAxisLabel()),
                    Flexible(child: _createMaxYAxisValue()),
                  ],
                ),
              ),
              const SizedBox(width: Dimensions.regular),
              Expanded(
                child: SizedBox.expand(
                  child: CustomPaint(
                    painter: LineChartPainter(
                      context,
                      widget.points,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Dimensions.tappable),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.regular),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.tappable),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: _createMinXAxisValue()),
              // const SizedBox(width: Dimensions.regular),
              Flexible(child: _createXAxisLabel()),
              // const SizedBox(width: Dimensions.regular),
              Flexible(child: _createMaxXAxisValue()),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.regular),
      ],
    );
  }

  Widget _createMinXAxisValue() {
    return Text(
      DateFormat.yMMMMd().format(widget.points.first.x),
      style: const TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createXAxisLabel() {
    return Text(
      widget.xAxisLabel,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createMaxXAxisValue() {
    return Text(
      DateFormat.yMMMMd().format(widget.points.last.x),
      style: const TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createYAxisLabel() {
    return Text(
      widget.yAxisLabel,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createMaxYAxisValue() {
    return Text(
      widget.points.map((point) => point.y).max.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }
  Widget _createMinYAxisValue() {
    return Text(
      widget.points.map((point) => point.y).min.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createPoint(ChartPoint point) {
    return SizedBox(
      width: Dimensions.tappable,
      height: Dimensions.tappable,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedScale(
            scale: point == _controller.selected
                ? 1.5
                : _controller.hovered.contains(point)
                    ? 1.25
                    : 1.0,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 250),
            child: Container(
              decoration: BoxDecoration(
                color: Palette.colors[8],
                borderRadius: BorderRadius.circular(Dimensions.regular / 2.0),
              ),
              width: Dimensions.regular,
              height: Dimensions.regular,
            ),
          ),
          InkResponse(
            radius: Dimensions.regular * 1.5,
            onHover: (isHovered) => _onPointHover(point, isHovered),
            onTap: () => _onPointTap(point),
          ),
        ],
      ),
    );
  }

  void _onPointTap(ChartPoint point) {
    setState(() {
      if (point == _controller.selected) {
        _controller.selected = null;
      } else {
        _controller.selected = point;
      }
    });

  }

  void _onPointHover(ChartPoint point, bool isHovered) {
    setState(() {
      if (isHovered) {
        _controller.hovered.add(point);
      } else {
        _controller.hovered.remove(point);
      }
    });
  }
}
