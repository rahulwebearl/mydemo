import 'package:flutter/material.dart';

class IncrementProvider extends ChangeNotifier {
  int pluseBT = 50;
  pluse() {
    pluseBT++;
    notifyListeners();
  }
}
