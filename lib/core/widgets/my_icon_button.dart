import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const MyIconButton({
    super.key,
    this.onTap,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.transparent.withOpacity(0),
        surfaceTintColor: Colors.transparent.withOpacity(0),
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(6),
            child: child,
          ),
        ));
  }
}
