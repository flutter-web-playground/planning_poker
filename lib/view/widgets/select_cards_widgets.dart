import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view/widgets/selectable_card_widget.dart';

class SelectCardWidget extends StatefulWidget {
  const SelectCardWidget({super.key});

  @override
  State<SelectCardWidget> createState() => _SelectCardWidgetState();
}

class _SelectCardWidgetState extends State<SelectCardWidget> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: SizedBox(
        height: kCardHeight * 1.5,
        width: kCardHeight * cardList.length,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(cardList.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index == selected ? -1 : index;
                  });
                },
                child: SelectableCardWidget(
                  selected: index == selected,
                  card: cardList[index],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
