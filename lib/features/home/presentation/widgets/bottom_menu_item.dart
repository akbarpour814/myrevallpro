import 'package:customer_club/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  final Widget selectedIcon;
  final Widget unSelectedIcon;
  final bool isSelected;
  const BottomMenuItem({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
          height: 66,
          width: 20.w(context),
          child: Center(
            child: isSelected ? selectedIcon : unSelectedIcon,
          )),
    );
  }
}
