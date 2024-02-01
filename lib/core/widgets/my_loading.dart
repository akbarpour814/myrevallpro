import 'package:customer_club/configs/color_palette.dart';
import 'package:customer_club/core/utils/extentions.dart';
import 'package:flutter/cupertino.dart';

class MyLoading extends StatelessWidget {
  final Color? color;
  final bool withText;
  const MyLoading({
    super.key,
    this.color,
    this.withText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
                color: color ?? ColorPalette.primaryColor),
          ],
        ),
        if (withText) ...[
          12.hsb(),
          Text(
            'لطفا کمی صبر کنید',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )
        ]
      ],
    );
  }
}
