import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';

class LeftTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final List<CardModel> leftTableList = [];

  LeftTableViewModel({required this.repository}) {
    repository.getLeftTable().listen((event) {
      leftTableList.add(event);
      notifyListeners();
    });
  }
}
