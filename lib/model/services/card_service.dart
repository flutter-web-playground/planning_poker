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
  }
}
