import 'package:flutter/material.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/gen/assets.gen.dart';
import 'package:revallpro/gen/fonts.gen.dart';
import 'package:revallpro/utils/assist.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/views/components/tag_item.dart';
import 'package:revallpro/views/tag_details_screen/tag_details_screen.dart';

class TextItem extends StatelessWidget {
  final TextModel item;
  final void Function(TextModel textModel) onEditPressed;
  const TextItem({
    required this.item,
    required this.onEditPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              8.wsb(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? '',
                      style: TextStyle(
                          fontFamily: isPersian(item.title ?? '')
                              ? FontFamily.iranSans
                              : null),
                    ),
                    if (item.tagsList != null) ...[
                      4.hsb(),
                      Wrap(
                        children: item.tagsList!
                            .map((e) => TagItem(
                                  item: e,
                                  onTap: () => MyNavigator.push(
                                      context,
                                      TagDetailsScreen(
                                        tagsModel: e,
                                        onEditPressed: onEditPressed,
                                      )),
                                ))
                            .toList(),
                      )
                    ]
                  ],
                ),
              ),
              IconButton(
                  onPressed: () => onEditPressed(item),
                  icon: Assets.resource.edit.svg())
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}
