import 'package:e_book/features/core_feature/data/models/volume/volume.dart';
import 'package:equatable/equatable.dart';

class DefaultCategoriesState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DefaultCategoriesInitial extends DefaultCategoriesState {}

class DefaultCategoriesLoading extends DefaultCategoriesState {}

class DefaultCategoriesFetched extends DefaultCategoriesState {
  List<Map<String, Volume>> listData;
  DefaultCategoriesFetched({required this.listData});
  @override
  // TODO: implement props
  List<Object?> get props => [listData];
}

class DefaultCategoriesFailed extends DefaultCategoriesState {
  String? message;
  DefaultCategoriesFailed(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
