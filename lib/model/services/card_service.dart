import 'dart:math';
import 'package:planning_poker/model/card_model.dart';

class CardService {
  Stream<CardModel> getTopTable() async* {
    Random random = Random(100);
    int count = 0;

    while (count < 10) {
      count += 1;
      await Future.delayed(const Duration(seconds: 1));

      yield CardModel(
        value: random.nextInt(100),
        id: '',
      );
    }
  }

  Stream<CardModel> getBottomTable() async* {
    Random random = Random(100);
    int count = 0;

    while (count < 6) {
      count += 1;
      await Future.delayed(const Duration(seconds: 1));

      yield CardModel(
        value: random.nextInt(100),
        id: '',
      );
    }
  }

  Stream<CardModel> getLeftTable() async* {
    Random random = Random(100);
    int count = 0;

    while (count < 4) {
      count += 1;
      await Future.delayed(const Duration(seconds: 1));

      yield CardModel(
        value: random.nextInt(100),
        id: '',
      );
    }
  }

  Stream<CardModel> getRightTable() async* {
    Random random = Random(100);
    int count = 0;

    while (count < 3) {
      count += 1;
      await Future.delayed(const Duration(seconds: 1));

      yield CardModel(
        value: random.nextInt(100),
        id: '',
      );
    }
  }
}
