import 'package:flutter/material.dart';
import 'package:planning_poker/model/table_model.dart';

class TableViewModel extends ValueNotifier<TableModel> {
  bool showCards = false;
  TableViewModel(super.value);

  void flipCard() {
    showCards = !showCards;
    notifyListeners();
  }
}
