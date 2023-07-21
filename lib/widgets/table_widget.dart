import 'package:flutter/material.dart';
import 'package:planning_poker/table_controller.dart';

class TableWidget extends StatelessWidget {
  final TableController controller;

  const TableWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        // child: Text('Escolha sua carta'),

        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return FilledButton(
              onPressed: controller.flipCard,
              // style: ButtonStyle(backgroundColor: MaterialStateProperty<Color>),
              child: controller.value ? const Text('Esconder cartas') : const Text('Mostrar cartas'),
            );
          },
        ),
      ),
    );
  }
}
