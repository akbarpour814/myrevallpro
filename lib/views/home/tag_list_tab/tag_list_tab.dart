import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/views/components/tag_item.dart';
import 'package:revallpro/views/home/tag_list_tab/bloc/tag_list_bloc.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/tag_details_screen/tag_details_screen.dart';

class TagListTab extends StatefulWidget {
  final void Function(TextModel textModel) onEditPressed;
  final String? searchQuery;
  const TagListTab({
    required this.onEditPressed,
    this.searchQuery,
    super.key,
  });

  @override
  State<TagListTab> createState() => _TagListTabState();
}

class _TagListTabState extends State<TagListTab> {
  List<TagsModel> tagList = [];

  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<TagListBloc>(context).state is! TagListLoaded) {
      BlocProvider.of<TagListBloc>(context).add(TagListLoadEvent());
    } else {
      _fillList(BlocProvider.of<TagListBloc>(context).state as TagListLoaded,
          context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagListBloc, TagListState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is TagListLoaded) {
          _fillList(state, context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.hsb(),
              if (state is TagListLoaded && state.tagList.isNotEmpty)
                Wrap(
                  runSpacing: 4,
                  spacing: 4,
                  children: (widget.searchQuery.isNotNullOrEmpty
                          ? state.tagList.where((element) =>
                              (element.title ?? '')
                                  .trim()
                                  .toLowerCase()
                                  .contains(widget.searchQuery!.toLowerCase()))
                          : state.tagList)
                      .map((e) => TagItem(
                            item: e,
                            isDense: false,
                            onTap: () => MyNavigator.push(
                                context,
                                TagDetailsScreen(
                                  tagsModel: e,
                                  onEditPressed: widget.onEditPressed,
                                )),
                          ))
                      .toList(),
                ),
              if (state is TagListLoading)
                Center(
                  child: Column(
                    children: [
                      25.h(context).hsb(),
                      CupertinoActivityIndicator(
                        color: Theme.of(context).primaryColor,
                        radius: 12,
                      )
                    ],
                  ),
                ),
              if ((state is TagListLoaded && state.tagList.isEmpty) ||
                  state is TagListError)
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.h(context).hsb(),
                      Text(
                        'Thank you to choosing us!',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Add your first tag.',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  void _fillList(TagListLoaded state, BuildContext context) {
    tagList = state.tagList;
    //برای سورت تگ هایی که بیشتر مصرف شده
    if (BlocProvider.of<TextListBloc>(context).state is TextListLoaded) {
      final textList =
          (BlocProvider.of<TextListBloc>(context).state as TextListLoaded)
              .textList;
      for (var element in tagList) {
        element.usedCount = textList
            .where((item) =>
                (item.tagsList ?? []).any((e) => e.title == element.title))
            .length;
      }
      tagList.sort(
        (b, a) => a.usedCount.compareTo(b.usedCount),
      );
      setState(() {});
    }
  }
}
