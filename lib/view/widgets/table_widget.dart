import 'package:flutter/material.dart';
import 'package:planning_poker/core/constants.dart';
import 'package:planning_poker/view_model/table_view_model.dart';

class TableWidget extends StatelessWidget {
  final TableViewModel controller;

  const TableWidget({
    super.key,
    required this.controller,
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
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return FilledButton(
              onPressed: controller.flipCard,
              child: controller.value ? const Text('Esconder cartas') : const Text('Mostrar cartas'),
            );
          },
        ),
      ),
    );
  }
}
