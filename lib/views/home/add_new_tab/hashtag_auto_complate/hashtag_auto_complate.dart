import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/utils/user_infos.dart';
import 'package:revallpro/views/home/add_new_tab/hashtag_auto_complate/bloc/hashtag_auto_complate_bloc.dart';

class HashtagAutocompleteOptions extends StatelessWidget {
  const HashtagAutocompleteOptions(
      {Key? key, required this.query, required this.onHashtagTap})
      : super(key: key);

  final String query;
  final ValueSetter<Hashtag> onHashtagTap;

  @override
  Widget build(BuildContext context) {
    List<TagsModel> hashtags = [];
    if (query.isNotEmpty) {
      UserInfos.getId().then((value) =>
          BlocProvider.of<HashtagAutoComplateBloc>(context)
              .add(HashtagAutoComplateLoadEvent(value ?? '')));
    }
    return BlocConsumer<HashtagAutoComplateBloc, HashtagAutoComplateState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HashtagAutoComplateLoaded) {
          hashtags = state.tagList.where((it) {
            final normalizedOption = (it.title ?? '').toLowerCase();
            final normalizedQuery = query.toLowerCase();
            return normalizedOption.contains(normalizedQuery);
          }).toList();
        }
      },
      builder: (context, state) {
        if (hashtags.isEmpty) return const SizedBox.shrink();
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: hashtags.length > 8 ? 8 : hashtags.length,
                  separatorBuilder: (_, __) => const Divider(height: 0),
                  itemBuilder: (context, i) {
                    final hashtag = hashtags.elementAt(i);
                    return ListTile(
                      dense: true,
                      title: Text('#${hashtag.title}'),
                      onTap: () => onHashtagTap(
                          Hashtag(name: hashtag.title ?? '', weight: i)),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Hashtag {
  const Hashtag({
    required this.name,
    required this.weight,
  });

  final String name;
  final int weight;
}
