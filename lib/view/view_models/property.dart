//------/dart and flutter packages
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Property extends StatelessWidget {
  late String property;
  late String value;
  late bool valueInTheEnd;
  late bool lastProperty;

  Property({
    Key? key,
    required this.property,
    required this.value,
    required this.valueInTheEnd,
    required this.lastProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.0,
        top: 0.0,
        right: 0.0,
        bottom: lastProperty ? 0.0 : 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text('$property:'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: valueInTheEnd
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
