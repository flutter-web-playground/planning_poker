import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planning_poker/view/widgets/back_card_widget.dart';
import 'package:planning_poker/view/widgets/front_card_widget.dart';
import 'package:planning_poker/view_model/table_view_model.dart';

class CardWidget extends StatefulWidget {
  final double width;
  final double height;
  final String value;
  final TableViewModel tableViewModel;
  final bool rotationX;

  const CardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.value,
    required this.tableViewModel,
    required this.rotationX,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final bool rotationX = widget.rotationX;

    return AnimatedBuilder(
      animation: widget.tableViewModel,
      builder: (BuildContext context, Widget? child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (child, animation) {
            final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
            return AnimatedBuilder(
              animation: rotateAnim,
              child: child,
              builder: (context, widget) {
                final isUnder = (const ValueKey(FrontCardWidget) != widget!.key);
                var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
                tilt *= isUnder ? -1.0 : 1.0;
                final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
                return Transform(
                  transform: rotationX ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt)) : (Matrix4.rotationX(value)..setEntry(3, 0, tilt)),
                  alignment: Alignment.center,
                  child: widget,
                );
              },
            );
          },
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeInBack.flipped,
          child: widget.tableViewModel.showCards
              ? FrontCardWidget(
                  key: const ValueKey(true),
                  width: widget.width,
                  height: widget.height,
                  value: widget.value,
                )
              : BackCardWidget(
                  key: const ValueKey(false),
                  width: widget.width,
                  height: widget.height,
                ),
        );
      },
    );
  }
}
