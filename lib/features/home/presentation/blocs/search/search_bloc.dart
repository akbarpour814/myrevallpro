import 'package:bloc/bloc.dart';
import 'package:customer_club/core/models/shop_model.dart';
import 'package:customer_club/core/utils/data_states.dart';
import 'package:customer_club/features/home/domain/use_cases/get_shop_with_qr_use_case.dart';
import 'package:customer_club/features/home/domain/use_cases/search_use_case.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchWithQREvent) {
        await _handleQr(emit, event);
      }
      if (event is SearchWithQueryEvent) {
        await _handleQuery(emit, event);
      }
      if (event is SearchClearEvent) {
        emit(SearchInitial());
      }
    });
  }

  Future<void> _handleQuery(
      Emitter<SearchState> emit, SearchWithQueryEvent event) async {
    emit(SearchLoading());
    final state = await SearchUseCase().call(event.query);
    if (state is DataSuccess) {
      emit(SearchLoaded(shopList: state.data!, isQR: false));
    } else {
      emit(SearchError());
    }
  }

  Future<void> _handleQr(
      Emitter<SearchState> emit, SearchWithQREvent event) async {
    emit(SearchLoading());
    final state = await GetShopWithQrUseCase().call(event.QR);
    if (state is DataSuccess) {
      emit(SearchLoaded(shopList: [state.data!], isQR: true));
    } else {
      emit(SearchError());
    }
  }
}
