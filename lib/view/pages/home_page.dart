import 'package:flutter/material.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/widgets/bottom_table_widget.dart';
import 'package:planning_poker/view/widgets/left_table_widget.dart';
import 'package:planning_poker/view/widgets/right_table_widget.dart';
import 'package:planning_poker/view/widgets/select_cards_widgets.dart';
import 'package:planning_poker/view/widgets/table_widget.dart';
import 'package:planning_poker/view/widgets/top_table_widget.dart';
import 'package:planning_poker/view_model/bottom_table_view_model.dart';
import 'package:planning_poker/view_model/left_table_view_model.dart';
import 'package:planning_poker/view_model/right_table_view_model.dart';
import 'package:planning_poker/view_model/table_view_model.dart';
import 'package:planning_poker/view_model/top_table_view_model.dart';

class HomePage extends StatefulWidget {
  final String tableId;
  final UserModel currentUser;

  const HomePage({
    super.key,
    required this.tableId,
    required this.currentUser,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TableViewModel controller;
  late CardRepository cardRepository;

  @override
  void initState() {
    controller = TableViewModel(TableModel(id: widget.tableId));
    cardRepository = CardRepository();

    cardRepository.addUserOnTable(
      tableId: widget.tableId,
      user: widget.currentUser,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.currentUser.name,
                    style: const TextStyle(height: 20),
                  ),
                  TopTableWidget(
                    tableViewModel: controller,
                    topTableViewModel: TopTableViewModel(
                      tableModel: controller.value,
                      repository: cardRepository,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LeftTableWidget(
                        tableViewModel: controller,
                        leftTableViewModel: LeftTableViewModel(
                          tableModel: controller.value,
                          repository: cardRepository,
                        ),
                      ),
                      TableWidget(
                        controller: controller,
                      ),
                      RightTableWidget(
                        tableViewModel: controller,
                        rightTableViewModel: RightTableViewModel(
                          tableModel: controller.value,
                          repository: cardRepository,
                        ),
                      ),
                    ],
                  ),
                  BottomTableWidget(
                    tableViewModel: controller,
                    bottomTableViewModel: BottomTableViewModel(
                      tableModel: controller.value,
                      repository: cardRepository,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SelectCardWidget(
              user: widget.currentUser,
              cardRepository: cardRepository,
            ),
          ],
        ),
      ),
    );
  }
}
