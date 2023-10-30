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

part 'add_new_event.dart';
part 'add_new_state.dart';

class AddNewBloc extends Bloc<AddNewEvent, AddNewState> {
  AddNewBloc() : super(AddNewInitial()) {
    on<AddNewEvent>((event, emit) async {
      if (event is AddNewTextRequestEvent) {
        try {
          emit(AddNewLoading());
          //در حالت حذف
          if (event.goDelete) {
            //دیتای مربوط به جدول ارتباط را دریافت میکند برای تکست جاری
            final tagTextListRes = await getIt<IMainRepository>()
                .getTextTagsByTextId(event.textModel.key!);
            if (tagTextListRes.validate) {
              //دیتای مربوط به جدول ارتباط را حذف میکند برای تکست جاری
              for (var element in (tagTextListRes!.data as List)
                  .map((e) => e as DataSnapshot)
                  .toList()) {
                await getIt<IMainRepository>().deleteTextTags(element.key!);
                //اگر تگی که برای تسک جاری حذف میشود برای تسکت دیگری استفاده نشده باشد حذف میشود
                final otherTextTagsRes = await getIt<IMainRepository>()
                    .getTextTagsByTagId((element.value as Map)['TagId']);
                if (otherTextTagsRes.validate &&
                    (otherTextTagsRes!.data as List).isEmpty) {
                  await getIt<IMainRepository>()
                      .deleteTag((element.value as Map)['TagId']);
                }
              }
              //حذف تکست جاری
              final res = await getIt<IMainRepository>()
                  .deleteText(event.textModel.key!);
              if (res.validateWithoutData) {
                //حذف نوتیف
                await localNotificationManager
                    .cancelById(event.textModel.key ?? '');
                emit(AddNewSuccess());
              } else {
                emit(AddNewError(res.getErrorMessage));
              }
            }
            // در حالت جدید یا ویرایش
          } else {
            //در صورتی که در حالت آپدیت باشد ابتدا دیتای مربوط به جدول ارتباط را حذف میکند برای تکست جاری
            if (event.textModel.key.isNotNullOrEmpty) {
              final textTagListRes = await getIt<IMainRepository>()
                  .getTextTagsByTextId(event.textModel.key!);
              if (textTagListRes.validate) {
                for (var element in (textTagListRes!.data as List)
                    .map((e) => e as DataSnapshot)
                    .toList()) {
                  await getIt<IMainRepository>().deleteTextTags(element.key!);
                  //اگر تگی که برای تسک جاری حذف میشود برای تسکت دیگری استفاده نشده باشد حذف میشود
                  final otherTextTagsRes = await getIt<IMainRepository>()
                      .getTextTagsByTagId((element.value as Map)['TagId']);
                  if (otherTextTagsRes.validate &&
                      (otherTextTagsRes!.data as List).isEmpty) {
                    await getIt<IMainRepository>()
                        .deleteTag((element.value as Map)['TagId']);
                  }
                }
              }
            }
            //مرتب سازی تگ هایی که از ورودی میاد
            List<String> tagList = event.tags
                .trim()
                .replaceAll(' ', '')
                .split('#')
                .where((element) => element.isNotEmpty)
                .toList();
            //دریافت تگ های قبلی
            final oldTagListRes = await getIt<IMainRepository>()
                .getTagsByUserId(event.textModel.issuer!);
            if (oldTagListRes.validate) {
              var oldTagList = (oldTagListRes!.data as List)
                  .map((e) =>
                      TagsModel.fromJson((e as DataSnapshot).value as Map))
                  .toList();
              //یافتن آی دی تگ هایی که از قبل وجود داشت
              final alreadyExistTagsId = (oldTagListRes.data as List)
                  .map((e) => (e as DataSnapshot))
                  .toList()
                  .where((element) => tagList.any((item) =>
                      item ==
                      (element.value as Map)['title'].toString().trim()))
                  .toList();
              //تگ هایی که از قبل ثبت شدن کم میشن
              tagList.removeWhere((element) => oldTagList
                  .any((item) => element.trim() == (item.title ?? '').trim()));
              if (tagList.isNotEmpty) {
                //تگ های جدید اینسرت میشن
                for (var element in tagList) {
                  await getIt<IMainRepository>().addNewTag(TagsModel(
                      title: element,
                      createAt: DateTime.now().toIso8601String(),
                      issuer: event.textModel.issuer!));
                }
              }
              //دریافت همه ی تگ ها
              final allTagListRes = await getIt<IMainRepository>()
                  .getTagsByUserId(event.textModel.issuer!);
              if (allTagListRes.validate) {
                //جدا کردن تگ هایی که جدید ثبت شدن برای تکست جاری
                var currentTagList = (allTagListRes!.data as List)
                    .map((e) => e as DataSnapshot)
                    .toList()
                    .where((element) => tagList
                        .any((item) => item == (element.value as Map)['title']))
                    .toList();
                //اینسرت یا آپدیت تکست جدید
                final addNewTextRes =
                    await (event.textModel.key.isNotNullOrEmpty
                        ? getIt<IMainRepository>().editText(event.textModel)
                        : getIt<IMainRepository>().addNewText(event.textModel));
                if (addNewTextRes.validate) {
                  //اینسرت ارتباط تکست با تگ های خودش
                  for (var item in [...currentTagList, ...alreadyExistTagsId]) {
                    await getIt<IMainRepository>().addNewTextTag(TextTagModel(
                        issuer: event.textModel.issuer,
                        tagId: item.key,
                        textId: addNewTextRes!.data.toString()));
                  }
                  //اگر در حالت ویرایش باشد نوتیف های قبلی را کنسل میکند
                  if (event.textModel.key.isNotNullOrEmpty) {
                    await localNotificationManager
                        .cancelById(event.textModel.key!);
                  }
                  localNotificationManager.scheduleShow(
                      id: addNewTextRes!.data.toString(),
                      data: event.textModel.title ?? '',
                      startTime: DateTime.now().toIso8601String());
                  emit(AddNewSuccess());
                } else {
                  emit(AddNewError(addNewTextRes.getErrorMessage));
                }
              } else {
                emit(AddNewError(allTagListRes.getErrorMessage));
              }
            } else {
              emit(AddNewError(oldTagListRes.getErrorMessage));
            }
          }
        } catch (e) {
          emit(AddNewError(null.getErrorMessage));
        }
      }
    });
  }
}
