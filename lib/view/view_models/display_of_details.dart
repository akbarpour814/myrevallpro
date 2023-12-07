//------/dart and flutter packages
import 'package:flutter/material.dart';

mixin DisplayOfDetails<T extends StatefulWidget> on State<T> {
  late List<bool> displayOfDetails;
  late int previousIndex;

  @override
  void initState() {
    super.initState();

    previousIndex = -1;
  }

  void display(int index) {
    setState(() {
      if (index == previousIndex && displayOfDetails[index]) {
        displayOfDetails[index] = false;
      } else if (index == previousIndex && !displayOfDetails[index]) {
        displayOfDetails[index] = true;
      } else if (index != previousIndex) {
        if (previousIndex != -1) {
          displayOfDetails[previousIndex] = false;
        }
        displayOfDetails[index] = true;
      }

      previousIndex = index;
    });
  }
}
