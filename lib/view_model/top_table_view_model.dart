import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class TopTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  TopTableViewModel({
    required this.tableModel,
    required this.repository,
  }) {
    repository.getTopTable(tableId: tableModel.id).listen((event) {
      tableModel.topTableList.removeWhere((element) => true);
      tableModel.topTableList.addAll(event.toList());

      notifyListeners();
    });
  }
}
