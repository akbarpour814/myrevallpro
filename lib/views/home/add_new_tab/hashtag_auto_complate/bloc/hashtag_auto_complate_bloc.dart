import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';
import 'package:revallpro/data/model/tags_model.dart';
import 'package:revallpro/data/repo/main_repository.dart';
import 'package:revallpro/di/di.dart';
import 'package:revallpro/utils/extentions.dart';

part 'hashtag_auto_complate_event.dart';
part 'hashtag_auto_complate_state.dart';

class HashtagAutoComplateBloc
    extends Bloc<HashtagAutoComplateEvent, HashtagAutoComplateState> {
  HashtagAutoComplateBloc() : super(HashtagAutoComplateInitial()) {
    on<HashtagAutoComplateEvent>((event, emit) async {
      if (event is HashtagAutoComplateLoadEvent) {
        try {
          emit(HashtagAutoComplateLoading());
          final res =
              await getIt<IMainRepository>().getTagsByUserId(event.userId);
          if (res.validate) {
            emit(HashtagAutoComplateLoaded((res!.data as List)
                .map(
                    (e) => TagsModel.fromJson((e as DataSnapshot).value as Map))
                .toList()));
          } else {
            emit(HashtagAutoComplateError(res.getErrorMessage));
          }
        } catch (e) {
          emit(HashtagAutoComplateError(null.getErrorMessage));
        }
      }
    });
  }
}
