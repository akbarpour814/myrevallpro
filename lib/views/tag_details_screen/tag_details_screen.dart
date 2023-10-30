import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/views/components/text_item.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';

class TagDetailsScreen extends StatefulWidget {
  final TagsModel tagsModel;
  final void Function(TextModel textModel) onEditPressed;
  const TagDetailsScreen(
      {required this.tagsModel, required this.onEditPressed, super.key});

  @override
  State<TagDetailsScreen> createState() => _TagDetailsScreenState();
}

class _TagDetailsScreenState extends State<TagDetailsScreen> {
  List<TextModel> textList = [];

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<TextListBloc>(context);
    if (bloc.state is TextListLoaded) {
      textList = (bloc.state as TextListLoaded)
          .textList
          .where((element) => (element.tagsList ?? []).any(
              (item) => item.title!.trim() == widget.tagsModel.title!.trim()))
          .toList();
      for (var element in textList) {
        element.tagsList!
            .removeWhere((element) => element.key == widget.tagsModel.key);
        element.tagsList!.insert(0, widget.tagsModel);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.tagsModel.title ?? 'tag screen',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black54,
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        children: textList
            .map((e) => TextItem(
                  item: e,
                  onEditPressed: (item) {
                    Navigator.pop(context);
                    widget.onEditPressed(item);
                  },
                ))
            .toList(),
      ),
    );
  }
}
