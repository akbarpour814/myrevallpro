import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/repo/main_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/user_infos.dart';

part 'tag_list_event.dart';
part 'tag_list_state.dart';

class TagListBloc extends Bloc<TagListEvent, TagListState> {
  TagListBloc() : super(TagListInitial()) {
    on<TagListEvent>((event, emit) async {
      if (event is TagListClearEvent) {
        emit(TagListInitial());
      }
      if (event is TagListLoadEvent) {
        try {
          emit(TagListLoading());
          String? userId = await UserInfos.getId();
          final res = await getIt<IMainRepository>().getTagsByUserId(userId!);
          if (res.validate) {
            List<TagsModel> retList = [];
            for (var e in (res!.data as List)) {
              retList.add(TagsModel.fromJson((e as DataSnapshot).value as Map)
                ..key = e.key);
            }
            emit(TagListLoaded(retList));
          } else {
            emit(TagListError(res.getErrorMessage));
          }
        } catch (e) {
          emit(TagListError(null.getErrorMessage));
        }
      }
    });
  }
}
