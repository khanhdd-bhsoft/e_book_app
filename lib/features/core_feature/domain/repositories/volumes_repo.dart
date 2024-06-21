import 'package:dartz/dartz.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';

import '../../../../core/enum/search_field.dart';
import '../../../../core/error/failure.dart';

abstract class VolumesRepo {
  Future<Either<Failure, Volume?>> getSearchVolumesByText(
      {required String text, required int page});
  Future<Either<Failure, Volume?>> getSearchVolumesByTextAndParams(
      {required String text,
      required SearchField searchField,
      required int page});

  Future<Either<Failure, Item?>> getDetailVolumeItem(String id);
  Future<Either<Failure, Volume?>> getVolumeByCategory(
      {required int page, required String searchKey, required String category});
}
