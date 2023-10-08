import 'package:planning_poker/model/user_model.dart';

class TableModel {
  String id = '';
  List<UserModel> bottomTableList = [];
  List<UserModel> topTableList = [];
  List<UserModel> leftTableList = [];
  List<UserModel> rightTableList = [];

  TableModel({this.id = ''});
}
