import 'package:dartz/dartz.dart';
import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/domain/repositories/volumes_repo.dart';

import '../../../../../core/error/failure.dart';

class GetSearchVolumeByTextUC {
  VolumesRepo volumesRepo;
  GetSearchVolumeByTextUC(this.volumesRepo);
  Future<Either<Failure, Volume?>> call(
      {required String text, required int page}) async {
    return await volumesRepo.getSearchVolumesByText(text: text, page: page);
  }
}
