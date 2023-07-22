import 'package:flutter/material.dart';

class TableViewModel extends ValueNotifier<bool> {
  TableViewModel(super.value);

  void flipCard() {
    value = !value;
    notifyListeners();
  }
}
