import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class BottomTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  BottomTableViewModel({
    required this.tableModel,
    required this.repository,
  }) {
    repository.getBottomTable(tableId: tableModel.id).listen((event) {
      tableModel.bottomTableList.removeWhere((element) => true);
      tableModel.bottomTableList.addAll(event.toList());
      notifyListeners();
    });
  }
}
