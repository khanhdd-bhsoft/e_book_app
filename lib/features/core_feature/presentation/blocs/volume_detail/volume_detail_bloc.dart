import 'package:e_book/features/core_feature/domain/usecases/volume_item/get_volume_item_uc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeDetailBloc extends Bloc<VolumeDetailEvent, VolumeDetailState> {
  GetVolumeItemUseCase getVolumeItemUseCase;
  VolumeDetailBloc({required this.getVolumeItemUseCase})
      : super(VolumeDetailInitial()) {
    on<VolumeDetailFetch>(onVolumeDetailFetchEvent);
  }
  Future<void> onVolumeDetailFetchEvent(
      VolumeDetailFetch event, Emitter<VolumeDetailState> emit) async {
    try {
      emit(VolumeDetailLoading());
      final result = await getVolumeItemUseCase.call(event.id);
      result.fold(
          (l) => emit(
              VolumeDetailFailed(message: l.message ?? "Something went wrong")),
          (r) => emit(VolumeDetailFetched(r)));
    } catch (e) {
      emit(VolumeDetailFailed(message: "Something went wrong"));
    }
  }
}
