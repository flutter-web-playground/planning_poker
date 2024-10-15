import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isVoted;

  const BackCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.isVoted,
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
      child: isVoted ? const Icon(Icons.check) : null,
    );
  }
}
