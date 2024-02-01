import 'package:customer_club/configs/color_palette.dart';
import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final int star;
  final double? size;
  final bool secondColor;
  const StarWidget(
      {super.key, required this.star, this.size, this.secondColor = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          star > 4 ? Icons.star_rate_rounded : Icons.star_border_rounded,
          color: star > 4
              ? (secondColor
                  ? ColorPalette.bronzeColor
                  : ColorPalette.goldColor)
              : (secondColor ? Colors.grey : Colors.white),
          size: size,
        ),
        Icon(
          star >= 4 ? Icons.star_rate_rounded : Icons.star_border_rounded,
          color: star >= 4
              ? (secondColor
                  ? ColorPalette.bronzeColor
                  : ColorPalette.goldColor)
              : (secondColor ? Colors.grey : Colors.white),
          size: size,
        ),
        Icon(
          star >= 3 ? Icons.star_rate_rounded : Icons.star_border_rounded,
          color: star >= 3
              ? (secondColor
                  ? ColorPalette.bronzeColor
                  : ColorPalette.goldColor)
              : (secondColor ? Colors.grey : Colors.white),
          size: size,
        ),
        Icon(
          star >= 2 ? Icons.star_rate_rounded : Icons.star_border_rounded,
          color: star >= 2
              ? (secondColor
                  ? ColorPalette.bronzeColor
                  : ColorPalette.goldColor)
              : (secondColor ? Colors.grey : Colors.white),
          size: size,
        ),
        Icon(
          star >= 1 ? Icons.star_rate_rounded : Icons.star_border_rounded,
          color: star >= 1
              ? (secondColor
                  ? ColorPalette.bronzeColor
                  : ColorPalette.goldColor)
              : (secondColor ? Colors.grey : Colors.white),
          size: size,
        ),
      ],
    );
  }
}
