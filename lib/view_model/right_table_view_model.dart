import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';

class RightTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final List<CardModel> rightTableList = [];

  RightTableViewModel({required this.repository}) {
    repository.getRightTable().listen((event) {
      rightTableList.add(event);
      notifyListeners();
    });
  }
}
