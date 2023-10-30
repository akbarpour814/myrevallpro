import 'package:injectable/injectable.dart';
import 'package:revallpro/data/model/base_response_model.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/data/model/text_tag_model.dart';
import 'package:revallpro/data/source/main_data_source.dart';
import 'package:revallpro/di/di.dart';

abstract class IMainRepository {
  Future<BaseResponseModel?> getTextByUserId(String userId);
  Future<BaseResponseModel?> getTagsByUserId(String userId);
  Future<BaseResponseModel?> addNewTag(TagsModel requestModel);
  Future<BaseResponseModel?> addNewText(TextModel requestModel);
  Future<BaseResponseModel?> addNewTextTag(TextTagModel requestModel);
  Future<BaseResponseModel?> getTextTagsByTextId(String textId);
  Future<BaseResponseModel?> editText(TextModel requestModel);
  Future<BaseResponseModel?> deleteTextTags(String key);
  Future<BaseResponseModel?> deleteText(String key);
  Future<BaseResponseModel?> deleteTag(String key);
  Future<BaseResponseModel?> getTextTagsByTagId(String tagId);
}

@Injectable(
  as: IMainRepository,
)
class MainRepository implements IMainRepository {
  @override
  Future<BaseResponseModel?> getTextByUserId(String userId) =>
      getIt<IMainDataSource>().getTextByUserId(userId);

  @override
  Future<BaseResponseModel?> getTagsByUserId(String userId) =>
      getIt<IMainDataSource>().getTagsByUserId(userId);

  @override
  Future<BaseResponseModel?> addNewTag(TagsModel requestModel) =>
      getIt<IMainDataSource>().addNewTag(requestModel);

  @override
  Future<BaseResponseModel?> addNewText(TextModel requestModel) =>
      getIt<IMainDataSource>().addNewText(requestModel);

  @override
  Future<BaseResponseModel?> addNewTextTag(requestModel) =>
      getIt<IMainDataSource>().addNewTextTag(requestModel);

  @override
  Future<BaseResponseModel?> getTextTagsByTextId(String textId) =>
      getIt<IMainDataSource>().getTextTagsByTextId(textId);

  @override
  Future<BaseResponseModel?> editText(TextModel requestModel) =>
      getIt<IMainDataSource>().editText(requestModel);

  @override
  Future<BaseResponseModel?> deleteTextTags(String key) =>
      getIt<IMainDataSource>().deleteTextTags(key);

  @override
  Future<BaseResponseModel?> deleteText(String key) =>
      getIt<IMainDataSource>().deleteText(key);

  @override
  Future<BaseResponseModel?> deleteTag(String key) =>
      getIt<IMainDataSource>().deleteTag(key);

  @override
  Future<BaseResponseModel?> getTextTagsByTagId(String tagId) =>
      getIt<IMainDataSource>().getTextTagsByTagId(tagId);
}
