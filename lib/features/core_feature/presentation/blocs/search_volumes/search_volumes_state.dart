import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:e_book/features/core_feature/data/models/volumes_model.dart';
import 'package:equatable/equatable.dart';

class SearchVolumesState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchVolumesInitial extends SearchVolumesState {}

class SearchVolumesLoading extends SearchVolumesState {}

class SearchVolumeLoadNextPage extends SearchVolumesState {}

class SearchVolumesFetched extends SearchVolumesState {
  final Volume? volumesModel;
  SearchVolumesFetched({this.volumesModel});
  @override
  // TODO: implement props
  List<Object?> get props => [volumesModel];
}

class SearchVolumesFailed extends SearchVolumesState {
  String? message;
  SearchVolumesFailed({this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
