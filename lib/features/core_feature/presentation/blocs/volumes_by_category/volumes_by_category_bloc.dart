import 'package:e_book/features/core_feature/domain/usecases/volumes/get_volumes_by_category.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/volume/item.dart';

class VolumesByCategoryBloc
    extends Bloc<VolumesByCategoryEvent, VolumesByCategoryState> {
  GetVolumesByCategoryUsecase getVolumesByCategoryUsecase;
  VolumesByCategoryBloc({required this.getVolumesByCategoryUsecase})
      : super(VolumesByCategoryInitial()) {
    on<VolumesByCategoryFetch>(onVolumesByCategoryFetchEvent);
  }
  Future<void> onVolumesByCategoryFetchEvent(VolumesByCategoryFetch event,
      Emitter<VolumesByCategoryState> emit) async {
    try {
      if (event.page == 1) {
        emit(VolumesByCategoryLoading());
      }
      final result = await getVolumesByCategoryUsecase.call(
          category: event.category, page: event.page!);
      result.fold(
          (l) => emit(VolumesByCategoryFailed(
              message: l.message ?? "Something went wrong")), (r) {
        if (r != null) {
          // emit(SearchVolumeLoadNextPage());
          List<Item> updatedItems = [];
          if (state is VolumesByCategoryFetched &&
              (state as VolumesByCategoryFetched).volume != null) {
            updatedItems =
                List.from((state as VolumesByCategoryFetched).volume!.items!);
          }
          updatedItems.addAll(r.items!);

          final updatedVolume = r.copyWith(items: updatedItems);

          emit(VolumesByCategoryFetched(volume: updatedVolume));

          // emit(VolumesByCategoryFetched(volume: r))
        }
      });
    } catch (e) {
      emit(VolumesByCategoryFailed());
    }
  }
}
