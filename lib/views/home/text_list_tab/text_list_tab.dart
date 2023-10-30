import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/main.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/components/text_item.dart';

class TextListTab extends StatefulWidget {
  final void Function(TextModel textModel) onEditPressed;
  final String? searchQuery;
  const TextListTab({
    required this.onEditPressed,
    this.searchQuery,
    super.key,
  });

  @override
  State<TextListTab> createState() => _TextListTabState();
}

class _TextListTabState extends State<TextListTab> {
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<TextListBloc>(context).state is! TextListLoaded)
      BlocProvider.of<TextListBloc>(context).add(TextListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextListBloc, TextListState>(
      listenWhen: (previous, current) => previous != current,
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is TextListLoaded) {
          _loadFromNotification(state);
          notificationPayload.addListener(() {
            _loadFromNotification(state);
          });
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              12.hsb(),
              if (state is TextListLoaded && state.textList.isNotEmpty)
                ...(widget.searchQuery.isNotNullOrEmpty
                        ? state.textList.where((element) =>
                            (element.title ?? '')
                                .trim()
                                .toLowerCase()
                                .contains(widget.searchQuery!.toLowerCase()))
                        : state.textList)
                    .map((e) => TextItem(
                          item: e,
                          onEditPressed: widget.onEditPressed,
                        ))
                    .toList(),
              if (state is TextListLoading)
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
              if ((state is TextListLoaded && state.textList.isEmpty) ||
                  state is TextListError)
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
                        'Add your first content.',
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

  void _loadFromNotification(TextListLoaded state) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (notificationPayload.value.isNotNullOrEmpty) {
        try {
          await Future.delayed(Duration(seconds: 1));
          if (state.textList
              .any((element) => element.key == notificationPayload.value)) {
            widget.onEditPressed(state.textList.firstWhere(
                (element) => element.key == notificationPayload.value));
            notificationPayload.value = null;
          } else {
            notificationPayload.value = null;
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }
}
