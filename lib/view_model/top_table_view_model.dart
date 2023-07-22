import 'package:flutter/widgets.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';

class TopTableViewModel extends ChangeNotifier {
  final CardRepository repository;
  final List<CardModel> topTableList = [];

  TopTableViewModel({required this.repository}) {
    repository.getTopTable().listen((event) {
      topTableList.add(event);
      notifyListeners();
    });
  }
}
