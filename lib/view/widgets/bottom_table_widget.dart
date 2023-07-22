import 'package:flutter/material.dart';
import 'package:planning_poker/view/widgets/card_widget.dart';
import 'package:planning_poker/view_model/bottom_table_view_model.dart';
import 'package:planning_poker/view_model/table_view_model.dart';

class BottomTableWidget extends StatelessWidget {
  final TableViewModel tableViewModel;
  final BottomTableViewModel bottomTableViewModel;

  const BottomTableWidget({
    super.key,
    required this.tableViewModel,
    required this.bottomTableViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bottomTableViewModel,
        builder: (context, _) {
          return SizedBox(
            width: 400,
            height: 50,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  bottomTableViewModel.bottomTableList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CardWidget(
                      width: 50,
                      height: 90,
                      value: bottomTableViewModel.bottomTableList[index].value,
                      controller: tableViewModel,
                      rotationX: true,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
