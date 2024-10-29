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
              Center(
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: (height / 2),
                      ),
                ),
              ),
            if (name.isNotEmpty)
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: (height / 2),
                        ),
                  ),
                ),
              ),
            if (name.isNotEmpty)
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  height: 26,
                  child: Text(
                    name,
                    overflow: name.length > 8 ? TextOverflow.fade : TextOverflow.visible,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
