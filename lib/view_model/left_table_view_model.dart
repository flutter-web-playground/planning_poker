import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class LeftTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  LeftTableViewModel({
    required this.tableModel,
    required this.repository,
  }) {
    repository.getLeftTable(tableId: tableModel.id).listen((event) {
      tableModel.leftTableList.removeWhere((element) => true);
      tableModel.leftTableList.addAll(event.toList());
      notifyListeners();
    });
  }
}
