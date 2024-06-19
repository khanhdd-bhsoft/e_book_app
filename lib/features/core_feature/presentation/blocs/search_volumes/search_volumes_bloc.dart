import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text_param.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchVolumeBloc extends Bloc<SearchVolumesEvent, SearchVolumesState> {
  GetSearchVolumeByTextParamUC getSearchVolumeByTextParamUC;
  GetSearchVolumeByTextUC getSearchVolumeByTextUC;
  String searchKey = "";
  SearchVolumeBloc(
      {required this.getSearchVolumeByTextParamUC,
      required this.getSearchVolumeByTextUC})
      : super(SearchVolumesInitial()) {
    on<SearchVolumesWithKey>(onSearchVolumesWithKeyEvent);
    on<SearchVolumesWithKeyAndParams>(onSearchVolumesWithKeyAndParamEvent);
  }
  void onSubmit(String key) {
    searchKey = key;
  }

  Future<void> onSearchVolumesWithKeyEvent(
      SearchVolumesWithKey event, Emitter<SearchVolumesState> emit) async {
    try {
      if (event.page == 1) {
        emit(SearchVolumesLoading());
      }
      final result = await getSearchVolumeByTextUC.call(
          page: event.page, text: event.searchKey);
      result.fold((l) => emit(SearchVolumesFailed(message: l.message)), (r) {
        if (r != null) {
          // emit(SearchVolumeLoadNextPage());
          List<Item> updatedItems = [];
          if (state is SearchVolumesFetched &&
              (state as SearchVolumesFetched).volumesModel != null) {
            updatedItems =
                List.from((state as SearchVolumesFetched).volumesModel!.items!);
          }
          updatedItems.addAll(r.items!);

          final updatedVolume = r.copyWith(items: updatedItems);

          emit(SearchVolumesFetched(volumesModel: updatedVolume));
        }
      });
    } catch (e) {
      emit(SearchVolumesFailed(message: "Something went wrong"));
    }
  }

  Future<void> onSearchVolumesWithKeyAndParamEvent(
      SearchVolumesWithKeyAndParams event,
      Emitter<SearchVolumesState> emit) async {
    try {
      if (event.page == 1) {
        emit(SearchVolumesLoading());
      }

      final result = await getSearchVolumeByTextParamUC.call(
          text: event.searchKey,
          searchField: event.searchField,
          page: event.page);

      result.fold((l) => emit(SearchVolumesFailed(message: l.message)), (r) {
        if (r != null) {
          List<Item> updatedItems = [];
          if (state is SearchVolumesFetched &&
              (state as SearchVolumesFetched).volumesModel != null) {
            updatedItems =
                List.from((state as SearchVolumesFetched).volumesModel!.items!);
          }
          updatedItems.addAll(r.items!);

          final updatedVolume = r.copyWith(items: updatedItems);

          emit(SearchVolumesFetched(volumesModel: updatedVolume));
        }
      });
    } catch (e) {
      emit(SearchVolumesFailed(message: "Something went wrong"));
    }
  }
}
