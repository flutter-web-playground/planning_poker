import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/services/card_service.dart';

class CardRepository {
  final CardService _service = CardService();

  Stream<CardModel> getTopTable() async* {
    yield* _service.getTopTable();
  }

  Stream<CardModel> getBottomTable() async* {
    yield* _service.getBottomTable();
  }

  Stream<CardModel> getLeftTable() async* {
    yield* _service.getLeftTable();
  }

  Stream<CardModel> getRightTable() async* {
    yield* _service.getRightTable();
  }
}
