import 'package:flutter/material.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/left_table_view_model.dart';
import 'package:planning_poker/view_model/table_view_model.dart';

class LeftTableWidget extends StatelessWidget {
  final TableViewModel tableViewModel;
  final LeftTableViewModel leftTableViewModel;

  const LeftTableWidget({
    super.key,
    required this.tableViewModel,
    required this.leftTableViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: leftTableViewModel,
      builder: (context, _) {
        return SizedBox(
          height: 200,
          width: 50,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: List.generate(
                leftTableViewModel.leftTableList.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardWidget(
                    width: 90,
                    height: 60,
                    value: leftTableViewModel.leftTableList[index].value,
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
