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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: specter
                  ? Text(
                      '🕵️‍♂️',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 40,
                          ),
                    )
                  : isVoted
                      ? Text(
                          '👍',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 40,
                                  ),
                        )
                      : const SizedBox(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              alignment: Alignment.center,
              height: 20,
              child: Text(
                name,
                overflow:
                    name.length > 8 ? TextOverflow.fade : TextOverflow.visible,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
