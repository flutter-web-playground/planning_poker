import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class ShowCardsViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  ShowCardsViewModel({
    required this.tableModel,
    required this.repository,
  }) {
    repository.getShowCards(tableId: tableModel.id).listen((event) {
      tableModel.showCards = event;
      notifyListeners();
    });
  }

  void flipCards() {
    repository.flipCards(table: tableModel);
  }
}
