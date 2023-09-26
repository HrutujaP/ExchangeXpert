import 'dart:core';

import 'package:flutter/widgets.dart';

class ChartController<T> extends ChangeNotifier {
  List<T> _hovered = [];
  T? _selected;

  List<T> get hovered => _hovered;
  set hovered(List<T> hovered) {
    _hovered = hovered;
    notifyListeners();
  }

  T? get selected => _selected;
  set selected(T? selected) {
    _selected = selected;
    notifyListeners();
  }

  ChartController();
}
