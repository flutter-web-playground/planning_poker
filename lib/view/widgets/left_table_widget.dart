import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/left_table_view_model.dart';

import '../../view_model/show_cards_view_model.dart';

class LeftTableWidget extends StatelessWidget {
  final LeftTableViewModel leftTableViewModel;
  final ShowCardsViewModel showCardsViewModel;

  const LeftTableWidget({
    super.key,
    required this.leftTableViewModel,
    required this.showCardsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: leftTableViewModel,
      builder: (context, _) {
        return SizedBox(
          height: kTableHeigth,
          width: kCardHeight,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: List.generate(
                leftTableViewModel.tableModel.leftTableList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardWidget(
                    width: kCardHeight,
                    height: kCardWidth,
                    user: leftTableViewModel.tableModel.leftTableList[index],
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
