//------/dart and flutter packages
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowStars extends StatelessWidget {
  late int numberOfStars;

  ShowStars({
    Key? key,
    required this.numberOfStars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: ''.padLeft(5 - numberOfStars, '\u2605'),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.amber.withOpacity(0.4),
            ),
        children: <InlineSpan>[
          TextSpan(
            text: ''.padLeft(numberOfStars, '\u2605'),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
