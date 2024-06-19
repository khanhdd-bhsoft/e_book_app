import 'package:e_book/core/enum/search_field.dart';
import 'package:equatable/equatable.dart';

class SearchVolumesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchVolumesWithKey extends SearchVolumesEvent {
  String searchKey;
  int page;

  SearchVolumesWithKey({required this.searchKey, this.page = 1});
  @override
  // TODO: implement props
  List<Object?> get props => [searchKey];
}

class SearchVolumesWithKeyAndParams extends SearchVolumesEvent {
  String searchKey;
  SearchField searchField;
  int page;
  SearchVolumesWithKeyAndParams(
      {required this.searchKey, required this.searchField, this.page = 1});
  @override
  // TODO: implement props
  List<Object?> get props => [searchKey, searchField];
}
