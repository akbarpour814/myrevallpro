import 'package:flutter/material.dart';
import 'package:revallpro/utils/extentions.dart';

class AreYouSureAlert extends StatelessWidget {
  final void Function() onSurePressed;
  const AreYouSureAlert({required this.onSurePressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                side: MaterialStateProperty.all(
                    BorderSide(color: Theme.of(context).primaryColor)),
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                minimumSize: MaterialStateProperty.all(Size(100, 40))),
            onPressed: onSurePressed,
            child: Text(
              '''Yes I'm sure''',
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(120, 40))),
            onPressed: () => Navigator.pop(context),
            child: Text('No'))
      ],
      content: SizedBox(
        height: 80,
        width: 60.w(context),
        child: Center(
          child: Text(
            'Are you sure you want to delete this item?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}
