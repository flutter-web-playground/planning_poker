import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/right_table_view_model.dart';

import '../../view_model/show_cards_view_model.dart';

class RightTableWidget extends StatelessWidget {
  final RightTableViewModel rightTableViewModel;
  final ShowCardsViewModel showCardsViewModel;

  const RightTableWidget({
    super.key,
    required this.rightTableViewModel,
    required this.showCardsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rightTableViewModel,
      builder: (context, _) {
        return SizedBox(
          height: kTableHeigth,
          width: kCardHeight,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: List.generate(
                rightTableViewModel.tableModel.rightTableList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardWidget(
                    width: kCardHeight,
                    height: kCardWidth,
                    user: rightTableViewModel.tableModel.rightTableList[index],
                    rotationX: false,
                    showCardsViewModel: showCardsViewModel,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
