import 'package:e_book/features/auth/data/data_sources/auth_data_source.dart';
import 'package:e_book/features/auth/data/repositories/auth_repository.dart';
import 'package:e_book/features/auth/domain/repositories/auth_repo.dart';
import 'package:e_book/features/auth/domain/usecases/get_current_user_uc.dart';
import 'package:e_book/features/auth/domain/usecases/sign_in_uc.dart';
import 'package:e_book/features/auth/domain/usecases/sign_out_uc.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:e_book/features/core_feature/data/data_sources/themes_data_source.dart';
import 'package:e_book/features/core_feature/data/data_sources/volume_data_source.dart';
import 'package:e_book/features/core_feature/data/repositories/themes_repository.dart';
import 'package:e_book/features/core_feature/data/repositories/volumes_repository.dart';
import 'package:e_book/features/core_feature/domain/repositories/themes_repo.dart';
import 'package:e_book/features/core_feature/domain/repositories/volumes_repo.dart';
import 'package:e_book/features/core_feature/domain/usecases/themes/change_theme_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/themes/get_theme_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volume_item/get_volume_item_uc.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_search_volumes_by_text_param.dart';
import 'package:e_book/features/core_feature/domain/usecases/volumes/get_volumes_by_category.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/themes/theme_cubit.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerFactory<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => sharedPreferences);

  // data source
  sl.registerLazySingleton<VolumeDataSource>(() => VolumeDataSource());
  sl.registerLazySingleton<ThemesDataSource>(() => ThemesDataSource());
  sl.registerFactory<AuthDataSource>(() => AuthDataSource(auth: sl()));

  // repositories
  sl.registerLazySingleton<VolumesRepo>(
      () => VolumesRepository(volumeDataSource: sl()));
  sl.registerLazySingleton<ThemesRepo>(
      () => ThemeRepository(themesDataSource: sl()));
  sl.registerFactory<AuthRepo>(() => AuthRepository(authDataSource: sl()));

  // usecases
  sl.registerLazySingleton<GetSearchVolumeByTextParamUC>(
      () => GetSearchVolumeByTextParamUC(sl()));
  sl.registerLazySingleton<GetSearchVolumeByTextUC>(
      () => GetSearchVolumeByTextUC(sl()));
  sl.registerLazySingleton<GetVolumeItemUseCase>(
      () => GetVolumeItemUseCase(sl()));
  sl.registerLazySingleton<GetVolumesByCategoryUsecase>(
      () => GetVolumesByCategoryUsecase(volumesRepository: sl()));

  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(authRepo: sl()));
  sl.registerLazySingleton<SignInUseCase>(() => SignInUseCase(authRepo: sl()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(authRepo: sl()));

  sl.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(themeRepository: sl()));
  sl.registerLazySingleton<ChangeThemeUseCase>(
      () => ChangeThemeUseCase(themeRepository: sl()));

  // blocs
  sl.registerFactory<SearchVolumeBloc>(() => SearchVolumeBloc(
      getSearchVolumeByTextParamUC: sl(), getSearchVolumeByTextUC: sl()));
  sl.registerFactory<VolumeDetailBloc>(
      () => VolumeDetailBloc(getVolumeItemUseCase: sl()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(
      getCurrentUserUseCase: sl(), signInUseCase: sl(), signOutUseCase: sl()));

  sl.registerLazySingleton<DefaultCategoriesBloc>(
      () => DefaultCategoriesBloc(getVolumesByCategoryUsecase: sl()));
  sl.registerFactory<VolumesByCategoryBloc>(
      () => VolumesByCategoryBloc(getVolumesByCategoryUsecase: sl()));

  sl.registerFactory<ThemeCubit>(
      () => ThemeCubit(changeThemeUseCase: sl(), getThemeUseCase: sl()));
}
