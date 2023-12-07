//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/main
import '/main.dart';

SnackBar customSnackBar(BuildContext context, IconData contentIcon,
    String contentText, int duration) {
  return SnackBar(
    backgroundColor: Theme.of(context).primaryColor,
    shape: const Border(
      bottom: BorderSide(color: Colors.white),
    ),
    padding: const EdgeInsets.all(8.0),
    duration: Duration(seconds: duration),
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            contentIcon,
            color: Colors.white,
          ),
        ),
        Text(
          contentText,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: fontFamily,
          ),
        ),
      ],
    ),
  );
}
