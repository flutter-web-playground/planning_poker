import 'package:planning_poker/model/services/card_service.dart';
import 'package:planning_poker/model/user_model.dart';

class CardRepository {
  final CardService _service = CardService();

  Stream<List<UserModel>> getTopTable({required String tableId}) async* {
    yield* _service.getTopTable(tableId: tableId);
  }

  Stream<List<UserModel>> getBottomTable({required String tableId}) async* {
    yield* _service.getBottomTable(tableId: tableId);
  }

  Stream<List<UserModel>> getLeftTable({required String tableId}) async* {
    yield* _service.getLeftTable(tableId: tableId);
  }

  Stream<List<UserModel>> getRightTable({required String tableId}) async* {
    yield* _service.getRightTable(tableId: tableId);
  }
}
