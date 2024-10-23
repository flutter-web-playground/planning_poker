import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool isVoted;
  final bool specter;
  final String name;

  const BackCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.isVoted,
    this.specter = false,
    required this.name,
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
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: specter
                ? const Icon(Icons.remove_red_eye_outlined)
                : isVoted
                    ? const Icon(Icons.check)
                    : const SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
