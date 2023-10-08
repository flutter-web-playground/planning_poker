import 'package:firebase_database/firebase_database.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/user_model.dart';

class CardService {
  FirebaseDatabase database = FirebaseDatabase.instance;

  Stream<List<UserModel>> getTopTable({required String tableId}) {
    return database.ref('room/$tableId/top').onValue.map(
      (e) {
        List<UserModel> userModelList = [];
        for (var value in e.snapshot.children) {
          UserModel userModel = UserModel(id: '', name: value.key.toString(), card: CardModel(value: value.value.toString()));
          userModelList.add(userModel);
        }
        return userModelList;
      },
    );
  }

  Stream<List<UserModel>> getBottomTable({required String tableId}) {
    return database.ref('room/$tableId/bottom').onValue.map(
      (e) {
        List<UserModel> userModelList = [];
        for (var value in e.snapshot.children) {
          UserModel userModel = UserModel(id: '', name: value.key.toString(), card: CardModel(value: value.value.toString()));
          userModelList.add(userModel);
        }
        return userModelList;
      },
    );
  }

  Stream<List<UserModel>> getLeftTable({required String tableId}) {
    return database.ref('room/$tableId/left').onValue.map(
      (e) {
        List<UserModel> userModelList = [];
        for (var value in e.snapshot.children) {
          UserModel userModel = UserModel(id: '', name: value.key.toString(), card: CardModel(value: value.value.toString()));
          userModelList.add(userModel);
        }
        return userModelList;
      },
    );
  }

  Stream<List<UserModel>> getRightTable({required String tableId}) {
    return database.ref('room/$tableId/right').onValue.map(
      (e) {
        List<UserModel> userModelList = [];
        for (var value in e.snapshot.children) {
          UserModel userModel = UserModel(id: '', name: value.key.toString(), card: CardModel(value: value.value.toString()));
          userModelList.add(userModel);
        }
        return userModelList;
      },
    );
  }
}
