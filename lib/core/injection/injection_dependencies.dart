import 'package:e_book/features/core_feature/data/data_sources/volume_data_source.dart';
import 'package:e_book/features/core_feature/data/repositories/volumes_repository.dart';
import 'package:e_book/features/core_feature/domain/repositories/volumes_repo.dart';
import 'package:e_book/features/core_feature/domain/usecases/volume_item/get_volume_item_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text_param.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  // data source
  sl.registerLazySingleton<VolumeDataSource>(() => VolumeDataSource());

  // repositories
  sl.registerLazySingleton<VolumesRepo>(
      () => VolumesRepository(volumeDataSource: sl()));

  // usecases
  sl.registerLazySingleton<GetSearchVolumeByTextParamUC>(
      () => GetSearchVolumeByTextParamUC(sl()));
  sl.registerLazySingleton<GetSearchVolumeByTextUC>(
      () => GetSearchVolumeByTextUC(sl()));
  sl.registerLazySingleton<GetVolumeItemUseCase>(
      () => GetVolumeItemUseCase(sl()));

  // blocs
  sl.registerFactory<SearchVolumeBloc>(() => SearchVolumeBloc(
      getSearchVolumeByTextParamUC: sl(), getSearchVolumeByTextUC: sl()));
  sl.registerFactory<VolumeDetailBloc>(
      () => VolumeDetailBloc(getVolumeItemUseCase: sl()));
}
