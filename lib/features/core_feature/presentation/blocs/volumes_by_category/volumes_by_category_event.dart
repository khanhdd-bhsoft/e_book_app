import 'package:equatable/equatable.dart';

class VolumesByCategoryEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class VolumesByCategoryFetch extends VolumesByCategoryEvent {
  int? page;
  String category;
  String searchKey;
  VolumesByCategoryFetch(
      {required this.category, this.page = 1, this.searchKey = ""});
  @override
  // TODO: implement props
  List<Object?> get props => [page, category];
}
