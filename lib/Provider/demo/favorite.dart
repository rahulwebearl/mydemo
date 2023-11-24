import 'package:flutter/material.dart';

class favouriteProvider with ChangeNotifier {
  List<int> _selected = [];

  List<int> get selected => _selected;

  void additem(int value) {
    _selected.add(value);
    notifyListeners();
  }

  void removeitem(int value) {
    _selected.remove(value);
    notifyListeners();
  }
}
