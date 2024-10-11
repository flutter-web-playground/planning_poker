import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker/model/card_model.dart';
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

  createNewTable({required String tableId, required UserModel user}) {
    database.ref('room').update({
      tableId: {
        'top': user.toJson(),
      }
    });
  }

  Future<bool> addUserOnTable({required String tableId, required UserModel user}) async {
    final lastSide = (await database.ref('room/$tableId/lastSide').get()).value.toString();

    final nextSide = switch (lastSide.toString()) {
      'bottom' => 'left',
      'left' => 'top',
      'top' => 'right',
      'right' => 'bottom',
      _ => 'right',
    };

    database.ref('room/$tableId/lastSide').set(nextSide);
    database.ref('room/$tableId/$nextSide').update(user.toJson());
    user.side = nextSide;
    user.tableId = tableId;
    return true;
  }

  bool deleteUserOnTable({required UserModel user}) {
    database.ref('room/${user.tableId}/${user.side}/${user.id}').remove();
    return true;
  }

  bool updateUserCard({required UserModel user}) {
    database.ref('room/${user.tableId}/${user.side}/${user.id}/card').set(user.card.value);
    return true;
  }
}
