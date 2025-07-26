import 'package:flutter/widgets.dart';
import 'package:planning_poker/core/command.dart';
import 'package:planning_poker/core/result.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';

class ShowCardsViewModel extends ChangeNotifier {
  final CardRepository repository;
  final TableModel tableModel;

  late final Command0 showCards;

  ShowCardsViewModel({required this.tableModel, required this.repository}) {
    showCards = Command0(_showCards)..execute();

    repository.getShowCards(tableId: tableModel.id).listen((event) {
      tableModel.showCards = event;
      showCards.execute();
      notifyListeners();
    });

    repository.getAllSideTable(tableId: tableModel.id).listen((event) {
      for (var element in event.toList()) {
        if ((element.card.value.isNotEmpty || element.specter) && (!tableModel.showCards)) {
          tableModel.showCardsTimer = true;
        } else {
          tableModel.showCardsTimer = false;
          break;
        }
      }
      if (tableModel.showCardsTimer) {
        notifyListeners();
      }
    });
  }

  void flipCards() {
    repository.flipCards(table: tableModel);
  }

  Future<Result<bool>> _showCards() async {
    return Result.ok(tableModel.showCards);
  }
}
