import 'package:planning_poker/model/card_model.dart';

class UserModel {
  String id;
  String name;
  String side = '';
  String tableId = '';
  CardModel card;

  UserModel({
    required this.id,
    required this.name,
    required this.card,
  });

  factory UserModel.copyFrom(UserModel copy) {
    return UserModel(id: copy.id, name: copy.name, card: copy.card);
  }

  factory UserModel.empty() {
    return UserModel(id: '', name: '', card: CardModel(value: ''));
  }

  Map<String, Object> toJson() {
    return {
      id: {
        'name': name,
        'card': card.value,
      }
    };
  }
}
