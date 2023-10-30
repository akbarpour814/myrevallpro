import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/data/model/text_tag_model.dart';
import 'package:revallpro/data/repo/main_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/local_notification_manager.dart';
import 'package:revallpro/utils/user_infos.dart';

part 'text_list_event.dart';
part 'text_list_state.dart';

class TextListBloc extends Bloc<TextListEvent, TextListState> {
  TextListBloc() : super(TextListInitial()) {
    on<TextListEvent>((event, emit) async {
      if (event is TextListClearEvent) {
        emit(TextListInitial());
      }
      if (event is TextListLoadEvent) {
        try {
          emit(TextListLoading());
          final userId = await UserInfos.getId();
          //لیست تکست ها
          final textListRes =
              await getIt<IMainRepository>().getTextByUserId(userId!);
          if (textListRes.validate) {
            //لیست تگ ها
            final tagsListRes =
                await getIt<IMainRepository>().getTagsByUserId(userId);
            if (tagsListRes.validate) {
              final textList = (textListRes!.data as List)
                  .map((e) => (e as DataSnapshot))
                  .toList();
              final tagList = (tagsListRes!.data as List)
                  .map((e) => (e as DataSnapshot))
                  .toList();
              List<TextModel> retList = [];
              // تگ های مربوط به هر تکست را پیدا میکند
              for (var element in textList) {
                TextModel model = TextModel.fromJson(element.value as Map);
                model.key = element.key;
                model.tagsList = [];
                final textTagRes = await getIt<IMainRepository>()
                    .getTextTagsByTextId(element.key!);
                if (textTagRes.validate) {
                  final tagTextList = (textTagRes!.data as List)
                      .map((e) => TextTagModel.fromJson(
                          (e as DataSnapshot).value as Map))
                      .toList();
                  for (var item in tagTextList) {
                    model.tagsList!.add(TagsModel.fromJson(tagList
                        .firstWhere((e) => e.key == item.tagId)
                        .value as Map)
                      ..key = item.tagId);
                  }
                  retList.add(model);
                }
              }
              if (retList.isNotEmpty) {
                //برای نوتیف های دوره ای
                if (await UserInfos.getbool('newLogin') ?? false) {
                  await UserInfos.setBool('newLogin', false);
                  for (var element in retList) {
                    await localNotificationManager.scheduleShow(
                        id: element.key ?? '',
                        data: element.title ?? '',
                        startTime: element.createAt ??
                            DateTime.now().toIso8601String());
                  }
                }
                if (await UserInfos.isRandomNotification()) {
                  //استارت مجدد نوتیف های رندوم
                  List<String> titleList =
                      retList.map((e) => e.title ?? '').toList();
                  List<String> idList =
                      retList.map((e) => e.key ?? '').toList();
                  localNotificationManager.deleteAndRandomShow(
                      idList: idList, dataList: titleList);
                }
              }
              emit(TextListLoaded(retList.reversed.toList()));
            } else {
              emit(TextListError(tagsListRes.getErrorMessage));
            }
          } else {
            emit(TextListError(textListRes.getErrorMessage));
          }
        } catch (e) {
          emit(TextListError(null.getErrorMessage));
        }
      }
    });
  }
}
