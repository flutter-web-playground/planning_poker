import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/bottom_table_view_model.dart';

import '../../view_model/show_cards_view_model.dart';

class BottomTableWidget extends StatelessWidget {
  final ShowCardsViewModel showCardsViewModel;
  final BottomTableViewModel bottomTableViewModel;

  const BottomTableWidget({
    super.key,
    required this.bottomTableViewModel,
    required this.showCardsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bottomTableViewModel,
        builder: (context, _) {
          return SizedBox(
            width: kTableWidth,
            height: kCardHeight,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  bottomTableViewModel.tableModel.bottomTableList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardWidget(
                      width: kCardWidth,
                      height: kCardHeight,
                      user: bottomTableViewModel.tableModel.bottomTableList[index],
                      rotationX: true,
                      showCardsViewModel: showCardsViewModel,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
