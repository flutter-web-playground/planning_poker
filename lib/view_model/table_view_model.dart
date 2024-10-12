import 'package:flutter/material.dart';
import 'package:planning_poker/model/table_model.dart';
import 'package:planning_poker/model/user_model.dart';

class TableViewModel extends ValueNotifier<TableModel> {
  bool showCards = false;
  TableViewModel(super.value);

  void flipCard() {
    showCards = !showCards;
    notifyListeners();
  }

  (double, int) _tableSideAverage(List<UserModel> tableSide) {
    double sum = 0.0;
    int count = 0;
    for (var user in tableSide) {
      final value = double.tryParse(user.card.value) ?? 0.0;
      if (value > 0) {
        sum += value;
        count += 1;
      }
    }

    return (sum, count);
  }

  String average() {
    double a, sum = 0.0;
    int b, count = 0;

    (a, b) = _tableSideAverage(super.value.topTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(super.value.rightTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(super.value.bottomTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(super.value.leftTableList);
    sum += a;
    count += b;

    return count > 0 ? ((sum / count).toStringAsFixed(2)) : '';
  }
}
