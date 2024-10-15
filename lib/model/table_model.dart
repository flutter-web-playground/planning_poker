import 'package:planning_poker/model/user_model.dart';

class TableModel {
  String id = '';
  bool showCards = false;
  List<UserModel> bottomTableList = [];
  List<UserModel> topTableList = [];
  List<UserModel> leftTableList = [];
  List<UserModel> rightTableList = [];

  TableModel({this.id = ''});

  (double, int) _tableSideAverage(List<UserModel> tableSide) {
    double sum = 0.0;
    int count = 0;
    for (var user in tableSide) {
      final value = double.tryParse(user.card.value) ?? 0.0;
      if (value > 0) {
        sum += value;
        count += 1;
      }
    }

    return (sum, count);
  }

  String average() {
    double a, sum = 0.0;
    int b, count = 0;

    (a, b) = _tableSideAverage(topTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(rightTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(bottomTableList);
    sum += a;
    count += b;
    (a, b) = _tableSideAverage(leftTableList);
    sum += a;
    count += b;

    return count > 0 ? ((sum / count).toStringAsFixed(2)) : '';
  }
}
