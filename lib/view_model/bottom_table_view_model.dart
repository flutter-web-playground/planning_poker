import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';

class BottomTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final List<CardModel> bottomTableList = [];

  BottomTableViewModel({required this.repository}) {
    repository.getBottomTable().listen((event) {
      bottomTableList.add(event);
      notifyListeners();
    });
  }
}
