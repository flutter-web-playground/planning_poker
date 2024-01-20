import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';

class SelectCardWidget extends StatelessWidget {
  const SelectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(cardList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FrontCardWidget(
              width: kCardWidth,
              height: kCardHeight,
              value: cardList[index],
            ),
          );
        }),
      ),
    );
  }
}
