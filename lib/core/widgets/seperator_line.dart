import 'package:flutter/cupertino.dart';

class SeperatorLine extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? color;
  final int count;
  const SeperatorLine({
    this.padding,
    this.color,
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: Row(
        children: List.generate(
          count,
          (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Text(
                '_',
                style: TextStyle(color: color, fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
