import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/table_model.dart';
import 'package:planning_poker/view/widgets/bottom_table_widget.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';
import 'package:planning_poker/view/widgets/left_table_widget.dart';
import 'package:planning_poker/view/widgets/right_table_widget.dart';
import 'package:planning_poker/view/widgets/table_widget.dart';
import 'package:planning_poker/view/widgets/top_table_widget.dart';
import 'package:planning_poker/view_model/bottom_table_view_model.dart';
import 'package:planning_poker/view_model/left_table_view_model.dart';
import 'package:planning_poker/view_model/right_table_view_model.dart';
import 'package:planning_poker/view_model/table_view_model.dart';
import 'package:planning_poker/view_model/top_table_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TableViewModel controller = TableViewModel(TableModel(id: '123'));
    final CardRepository cardRepository = CardRepository();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
