import 'package:flutter/material.dart';

class TableController extends ValueNotifier<bool> {
  TableController(super.value);

  void flipCard() {
    value = !value;
    notifyListeners();
  }
}
