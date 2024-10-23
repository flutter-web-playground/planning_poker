import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';

class SelectableCardWidget extends StatelessWidget {
  final String card;
  final bool selected;

  const SelectableCardWidget({
    super.key,
    required this.card,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final double selectedValue = selected ? 1.3 : 1.0;
    return FrontCardWidget(
      width: kCardWidth * selectedValue,
      height: kCardHeight * selectedValue,
      value: card,
      name: '',
    );
  }
}
