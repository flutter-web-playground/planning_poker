import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/table_view_model.dart';
import 'package:planning_poker/view_model/top_table_view_model.dart';

class TopTableWidget extends StatelessWidget {
  final TableViewModel tableViewModel;
  final TopTableViewModel topTableViewModel;

  const TopTableWidget({
    super.key,
    required this.tableViewModel,
    required this.topTableViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: topTableViewModel,
      builder: (context, _) {
        return SizedBox(
          width: kTableWidth,
          height: kCardHeight,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                topTableViewModel.tableModel.topTableList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardWidget(
                    width: kCardWidth,
                    height: kCardHeight,
                    value: topTableViewModel.tableModel.topTableList[index].card.value.toString(),
                    tableViewModel: tableViewModel,
                    rotationX: true,
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
