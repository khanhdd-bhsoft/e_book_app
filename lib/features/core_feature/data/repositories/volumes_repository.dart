import 'package:dartz/dartz.dart';
import 'package:e_book/core/enum/search_field.dart';

import 'package:e_book/core/error/failure.dart';
import 'package:e_book/features/core_feature/data/data_sources/volume_data_source.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';

import 'package:e_book/features/core_feature/data/models/volumes_model.dart';

import '../../domain/repositories/volumes_repo.dart';

class VolumesRepository implements VolumesRepo {
  VolumeDataSource volumeDataSource;
  VolumesRepository({required this.volumeDataSource});

  @override
  Future<Either<Failure, Volume?>> getSearchVolumesByTextAndParams(
      {required String text,
      required SearchField searchField,
      required int page}) async {
    try {
      final data = await volumeDataSource.searchVolumeByTextAndParam(
          text, searchField, page);
      return Right(data);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, Volume?>> getSearchVolumesByText(
      {required String text, required int page}) async {
    try {
      final data = await volumeDataSource.searchVolumeByText(text, page);
      return Right(data);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }

  @override
  Future<Either<Failure, Item?>> getDetailVolumeItem(String id) async {
    try {
      final data = await volumeDataSource.getDetailVolumeItem(id);
      return Right(data);
    } catch (e) {
      return Left(ExceptionFailure());
    }
  }
}
