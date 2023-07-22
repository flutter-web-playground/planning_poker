import 'package:flutter/material.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/right_table_view_model.dart';
import 'package:planning_poker/view_model/table_view_model.dart';

class RightTableWidget extends StatelessWidget {
  final TableViewModel tableViewModel;
  final RightTableViewModel rightTableViewModel;

  const RightTableWidget({
    super.key,
    required this.tableViewModel,
    required this.rightTableViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rightTableViewModel,
      builder: (context, _) {
        return SizedBox(
          height: 200,
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: List.generate(
                rightTableViewModel.rightTableList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardWidget(
                    width: 90,
                    height: 60,
                    value: rightTableViewModel.rightTableList[index].value,
                    controller: tableViewModel,
                    rotationX: false,
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
