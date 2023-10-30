import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:revallpro/data/model/base_response_model.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/data/model/text_tag_model.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/const.dart';

abstract class IMainDataSource {
  Future<BaseResponseModel?> getTextByUserId(String userId);
  Future<BaseResponseModel?> getTagsByUserId(String userId);
  Future<BaseResponseModel?> getTextTagsByTextId(String textId);
  Future<BaseResponseModel?> addNewTag(TagsModel requestModel);
  Future<BaseResponseModel?> addNewText(TextModel requestModel);
  Future<BaseResponseModel?> addNewTextTag(TextTagModel requestModel);
  Future<BaseResponseModel?> editText(TextModel requestModel);
  Future<BaseResponseModel?> deleteTextTags(String key);
  Future<BaseResponseModel?> deleteText(String key);
  Future<BaseResponseModel?> deleteTag(String key);
  Future<BaseResponseModel?> getTextTagsByTagId(String tagId);
}

@Injectable(
  as: IMainDataSource,
)
class MainDataSource implements IMainDataSource {
  @override
  Future<BaseResponseModel?> getTextByUserId(String userId) async =>
      await getIt<DatabaseReference>()
          .child(TextsDbTable)
          .orderByChild("issuer")
          .equalTo(userId)
          .get()
          .then((value) =>
              BaseResponseModel(isSuccess: true, data: value.children.toList()))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> getTagsByUserId(String userId) async =>
      await getIt<DatabaseReference>()
          .child(TagsDbTable)
          .orderByChild("issuer")
          .equalTo(userId)
          .get()
          .then((value) =>
              BaseResponseModel(isSuccess: true, data: value.children.toList()))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> addNewTag(TagsModel requestModel) async =>
      await getIt<DatabaseReference>()
          .child(TagsDbTable)
          .push()
          .set(requestModel.toJson())
          .then((value) => BaseResponseModel(isSuccess: true))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> addNewText(TextModel requestModel) async {
    final query = getIt<DatabaseReference>().child(TextsDbTable).push();
    return await query
        .set(requestModel.toJson())
        .then((value) => BaseResponseModel(isSuccess: true, data: query.key))
        .onError((error, stackTrace) {
      return BaseResponseModel(isSuccess: false);
    });
  }

  @override
  Future<BaseResponseModel?> addNewTextTag(TextTagModel requestModel) async {
    return await getIt<DatabaseReference>()
        .child(TextTagDbTable)
        .push()
        .set(requestModel.toJson())
        .then((value) => BaseResponseModel(isSuccess: true))
        .onError((error, stackTrace) {
      return BaseResponseModel(isSuccess: false);
    });
  }

  @override
  Future<BaseResponseModel?> getTextTagsByTextId(String textId) async =>
      await getIt<DatabaseReference>()
          .child(TextTagDbTable)
          .orderByChild("TextId")
          .equalTo(textId)
          .get()
          .then((value) =>
              BaseResponseModel(isSuccess: true, data: value.children.toList()))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> editText(TextModel requestModel) async =>
      await getIt<DatabaseReference>()
          .child('$TextsDbTable/${requestModel.key}')
          .update(requestModel.toJson())
          .then((value) =>
              BaseResponseModel(isSuccess: true, data: requestModel.key))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> deleteTextTags(String key) async =>
      await getIt<DatabaseReference>()
          .child('$TextTagDbTable/$key')
          .remove()
          .then((value) => BaseResponseModel(isSuccess: true))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> deleteText(String key) async =>
      await getIt<DatabaseReference>()
          .child('$TextsDbTable/$key')
          .remove()
          .then((value) => BaseResponseModel(isSuccess: true))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> deleteTag(String key) async =>
      await getIt<DatabaseReference>()
          .child('$TagsDbTable/$key')
          .remove()
          .then((value) => BaseResponseModel(isSuccess: true))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });

  @override
  Future<BaseResponseModel?> getTextTagsByTagId(String tagId) async =>
      await getIt<DatabaseReference>()
          .child(TextTagDbTable)
          .orderByChild("TagId")
          .equalTo(tagId)
          .get()
          .then((value) =>
              BaseResponseModel(isSuccess: true, data: value.children.toList()))
          .onError((error, stackTrace) {
        return BaseResponseModel(isSuccess: false);
      });
}
