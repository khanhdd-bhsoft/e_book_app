import 'package:dartz/dartz.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';

import '../../../../../core/error/failure.dart';
import '../../repositories/volumes_repo.dart';

class GetVolumeItemUseCase {
  VolumesRepo volumesRepo;
  GetVolumeItemUseCase(this.volumesRepo);
  Future<Either<Failure, Item?>> call(String id) async {
    return await volumesRepo.getDetailVolumeItem(id);
  }
}
