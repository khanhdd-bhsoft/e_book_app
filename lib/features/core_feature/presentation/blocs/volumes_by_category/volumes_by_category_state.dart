import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:equatable/equatable.dart';

class VolumesByCategoryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumesByCategoryInitial extends VolumesByCategoryState {}

class VolumesByCategoryLoading extends VolumesByCategoryState {}

class VolumesByCategoryFetched extends VolumesByCategoryState {
  Volume? volume;
  VolumesByCategoryFetched({this.volume});
  @override
  // TODO: implement props
  List<Object?> get props => [volume];
}

class VolumesByCategoryFailed extends VolumesByCategoryState {
  String? message;
  VolumesByCategoryFailed({this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
