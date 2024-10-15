import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view_model/show_cards_view_model.dart';

class TableWidget extends StatelessWidget {
  final ShowCardsViewModel showCardsViewModel;

  const TableWidget({
    super.key,
    required this.showCardsViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kTableHeigth,
      width: kTableWidth,
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: showCardsViewModel,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: showCardsViewModel.flipCards,
                  child: showCardsViewModel.tableModel.showCards
                      ? const Text('Esconder cartas')
                      : const Text('Mostrar cartas'),
                ),
                if (showCardsViewModel.tableModel.showCards) Text('Média: ${showCardsViewModel.tableModel.average()}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
