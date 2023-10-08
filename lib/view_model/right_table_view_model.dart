import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class RightTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  RightTableViewModel({
    required this.tableModel,
    required this.repository,
  }) {
    repository.getRightTable(tableId: tableModel.id).listen((event) {
      tableModel.rightTableList.removeWhere((element) => true);
      tableModel.rightTableList.addAll(event.toList());
      notifyListeners();
    });
  }
}
