import 'package:dartz/dartz.dart';
import 'package:e_book/core/enum/search_field.dart';
import 'package:e_book/features/core_feature/domain/repositories/volumes_repo.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/models/volume/volume.dart';

class GetVolumesByCategoryUsecase {
  VolumesRepo volumesRepository;
  GetVolumesByCategoryUsecase({required this.volumesRepository});
  Future<Either<Failure, Volume?>> call(
      {required int page,
      String searchKey = "",
      required String category}) async {
    return await volumesRepository.getVolumeByCategory(
        page: page, category: category, searchKey: searchKey);
  }
}
