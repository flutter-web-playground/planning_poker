import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isVoted;
  final bool specter;

  const BackCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.isVoted,
    this.specter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: specter
          ? const Icon(Icons.remove_red_eye_outlined)
          : isVoted
              ? const Icon(Icons.check)
              : null,
    );
  }
}
