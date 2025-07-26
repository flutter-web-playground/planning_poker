import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/timer_widget.dart';
import 'package:planning_poker/view_model/show_cards_view_model.dart';

class TableWidget extends StatelessWidget {
  final ShowCardsViewModel showCardsViewModel;

  const TableWidget({
    super.key,
    required this.showCardsViewModel,
  });

  void _handleTimerEnd() {
    showCardsViewModel.flipCards();
    showCardsViewModel.tableModel.showCardsTimer = false;
  }

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
                Visibility(
                  visible: showCardsViewModel.tableModel.showCardsTimer,
                  child: TimerWidget(
                    durationInSeconds: 5,
                    onTimerEnd: _handleTimerEnd,
                  ),
                ),
                FilledButton(
                  onPressed: showCardsViewModel.tableModel.showCardsTimer ? null : showCardsViewModel.flipCards,
                  child: showCardsViewModel.tableModel.showCards
                      ? const Text('Esconder cartas')
                      : const Text('Mostrar cartas'),
                ),
                if (showCardsViewModel.tableModel.showCards)
                  FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 800)),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState == ConnectionState.done) {
                        return Text(
                          'Média: ${showCardsViewModel.tableModel.average()}',
                        );
                      }
                      return const SizedBox();
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
