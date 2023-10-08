import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';

class SelectCardWidget extends StatelessWidget {
  const SelectCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '1',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '2',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '3',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '5',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '8',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '13',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '21',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '34',
          ),
          FrontCardWidget(
            width: kCardWidth,
            height: kCardHeight,
            value: '?',
          ),
        ],
      ),
    );
  }
}
