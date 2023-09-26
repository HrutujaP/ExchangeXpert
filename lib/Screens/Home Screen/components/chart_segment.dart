import 'dart:ui';

class ChartSegment {
  final int id;
  final int value;
  final Color color;
  final String? label;

  const ChartSegment(
    this.id, {
    required this.value,
    required this.color,
    this.label,
  });
}
