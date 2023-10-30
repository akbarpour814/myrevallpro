import 'package:flutter/material.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/gen/fonts.gen.dart';
import 'package:revallpro/utils/assist.dart';

class TagItem extends StatelessWidget {
  final TagsModel item;
  final bool isDense;
  final void Function()? onTap;
  const TagItem({
    required this.item,
    this.isDense = true,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.grey.shade400)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(
            item.title ?? '',
            style: isDense
                ? Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black,
                    fontFamily: isPersian(item.title ?? '')
                        ? FontFamily.iranSans
                        : null)
                : TextStyle(
                    color: Colors.black,
                    fontFamily: isPersian(item.title ?? '')
                        ? FontFamily.iranSans
                        : null),
          ),
        ),
      ),
    );
  }
}
