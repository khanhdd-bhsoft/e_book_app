import 'package:dartz/dartz.dart';
import 'package:e_book/core/enum/search_field.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/domain/repositories/volumes_repo.dart';

import '../../../../../core/error/failure.dart';

class GetSearchVolumeByTextParamUC {
  VolumesRepo volumesRepo;
  GetSearchVolumeByTextParamUC(this.volumesRepo);
  Future<Either<Failure, Volume?>> call(
      {required String text,
      required SearchField searchField,
      required int page,
      required String criteriaString}) async {
    return await volumesRepo.getSearchVolumesByTextAndParams(
        text: text,
        searchField: searchField,
        page: page,
        criteriaString: criteriaString);
  }
}
