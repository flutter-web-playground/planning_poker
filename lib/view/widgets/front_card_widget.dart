import 'package:flutter/material.dart';

class FrontCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final String value;

  const FrontCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
