import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:equatable/equatable.dart';

class VolumeDetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumeDetailInitial extends VolumeDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumeDetailLoading extends VolumeDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumeDetailFetched extends VolumeDetailState {
  Item? item;
  VolumeDetailFetched(this.item);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumeDetailFailed extends VolumeDetailState {
  String? message;
  VolumeDetailFailed({this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
