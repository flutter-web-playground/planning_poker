import 'package:flutter/material.dart';

class FrontCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final String value;
  final String name;

  const FrontCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.value,
    required this.name,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (name.isEmpty)
              Text(
                value,
                style: TextStyle(fontSize: (width / 2)),
              ),
            if (name.isNotEmpty)
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: (width / 2)),
                  ),
                ),
              ),
            if (name.isNotEmpty)
              Expanded(
                flex: 1,
                child: Text(name),
              ),
          ],
        ),
      ),
    );
  }
}
