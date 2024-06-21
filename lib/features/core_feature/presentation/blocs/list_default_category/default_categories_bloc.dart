import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_volumes_by_category.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultCategoriesBloc
    extends Bloc<DefaultCategoriesEvent, DefaultCategoriesState> {
  GetVolumesByCategoryUsecase getVolumesByCategoryUsecase;
  DefaultCategoriesBloc({required this.getVolumesByCategoryUsecase})
      : super(DefaultCategoriesInitial()) {
    on<DefaultCategoriesFetch>(onDefaultCategoriesFetchEvent);
  }
  Future<void> onDefaultCategoriesFetchEvent(DefaultCategoriesFetch event,
      Emitter<DefaultCategoriesState> emit) async {
    try {
      emit(DefaultCategoriesLoading());
      List<Map<String, Volume>> listData = [];
      for (var i = 0; i < event.listData.length; i++) {
        final result = await getVolumesByCategoryUsecase.call(
            category: event.listData[i], page: 1);
        result.fold(
            (l) => emit(
                DefaultCategoriesFailed(l.message ?? "Something went wrong")),
            (r) {
          if (r != null) {
            listData.add(
              {
                event.listData[i]: r,
              },
            );
          }
        });
      }
      if (listData.isNotEmpty) {
        emit(DefaultCategoriesFetched(listData: listData));
      }
    } catch (e) {
      emit(DefaultCategoriesFailed("Something went wrong"));
    }
  }
}
