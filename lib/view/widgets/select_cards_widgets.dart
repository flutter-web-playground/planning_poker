import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/widgets/selectable_card_widget.dart';

import '../../model/repository/card_repository.dart';
import '../../view_model/table_view_model.dart';

class SelectCardWidget extends StatefulWidget {
  final CardRepository cardRepository;
  final UserModel user;
  final TableViewModel controller;

  const SelectCardWidget({
    super.key,
    required this.cardRepository,
    required this.user,
    required this.controller,
  });

  @override
  State<SelectCardWidget> createState() => _SelectCardWidgetState();
}

class _SelectCardWidgetState extends State<SelectCardWidget> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) => AbsorbPointer(
        absorbing: widget.controller.showCards,
        child: FittedBox(
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
                        widget.user.card.value = cardList[index];
                        widget.cardRepository.updateUserCard(user: widget.user);
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
        ),
      ),
    );
  }
}
