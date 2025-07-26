import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/table_model.dart';
import 'package:planning_poker/model/user_model.dart';

class CardService {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Stream<List<UserModel>> getTable({required String tableId, required String side}) {
    return database.ref('room/$tableId/$side').onValue.map(
      (e) {
        List<UserModel> userModelList = [];
        for (var user in e.snapshot.children) {
          final userData = json.decode(json.encode(user.value));
          UserModel userModel = UserModel(
            id: user.key.toString(),
            name: userData['name'].toString(),
            specter: userData['specter'] as bool,
            card: CardModel(
              value: userData['card'].toString(),
            ),
          );
          userModelList.add(userModel);
        }
        return userModelList;
      },
    );
  }

  Stream<List<UserModel>> getTopTable({required String tableId}) {
    return getTable(tableId: tableId, side: 'top');
  }

  Stream<List<UserModel>> getBottomTable({required String tableId}) {
    return getTable(tableId: tableId, side: 'bottom');
  }

  Stream<List<UserModel>> getLeftTable({required String tableId}) {
    return getTable(tableId: tableId, side: 'left');
  }

  Stream<List<UserModel>> getRightTable({required String tableId}) {
    return getTable(tableId: tableId, side: 'right');
  }

  Stream<List<UserModel>> getAllSideTable({required String tableId}) {
    return database.ref('room/$tableId').onValue.map((e) {
      List<UserModel> userModelList = [];
      for (var side in e.snapshot.children) {
        for (var user in (side.children)) {
          final userData = json.decode(json.encode(user.value));
          UserModel userModel = UserModel(
            id: user.key.toString(),
            name: userData['name'].toString(),
            specter: userData['specter'] as bool,
            card: CardModel(value: userData['card'].toString()),
          );
          userModelList.add(userModel);
        }
      }
      return userModelList;
    });
  }

  Stream<bool> getShowCards({required String tableId}) {
    return database.ref('room/$tableId/showcards').onValue.map((e) {
      final result = bool.tryParse(e.snapshot.value.toString()) ?? false;
      return result;
    });
  }

  void flipCards({required TableModel table}) {
    database.ref('room/${table.id}/showcards').set(!table.showCards);
  }

  Future<({String side, int count})> _getTableSize(String tableId, String side, bool isSide) async {
    final snapshot = await database.ref('room/$tableId/$side').get();

    final count = snapshot.children.length * (isSide ? 2 : 1);

    return (side: side, count: count);
  }

  Future<void> addUserOnTable({required String tableId, required UserModel user}) async {
    final sideListCount = <({String side, int count})>[];

    sideListCount.add(await _getTableSize(tableId, 'top', false));
    sideListCount.add(await _getTableSize(tableId, 'bottom', false));
    sideListCount.add(await _getTableSize(tableId, 'right', true));
    sideListCount.add(await _getTableSize(tableId, 'left', true));

    final minor = sideListCount.reduce((curr, next) {
      return curr.count < next.count ? curr : next;
    });

    database.ref('room/$tableId/${minor.side}').update(user.toJson());
    user.side = minor.side;
    user.tableId = tableId;
  }

  bool deleteUserOnTable({required UserModel user}) {
    database.ref('room/${user.tableId}/${user.side}/${user.id}').remove();
    return true;
  }

  bool updateUserCard({required UserModel user}) {
    database.ref('room/${user.tableId}/${user.side}/${user.id}/card').set(user.card.value);
    return true;
  }

  void updateUser({required UserModel user}) {
    database.ref('room/${user.tableId}/${user.side}').update(user.toJson());
  }
}
