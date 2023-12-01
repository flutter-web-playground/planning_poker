import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';

class SelectCardWidget extends StatelessWidget {
  const SelectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(cardList.length, (index) {
          return FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: cardList[index],
          );
        }),
      ),
    );
  }
}
