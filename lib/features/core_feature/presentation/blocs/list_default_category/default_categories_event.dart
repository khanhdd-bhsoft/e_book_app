import 'package:equatable/equatable.dart';

class DefaultCategoriesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DefaultCategoriesFetch extends DefaultCategoriesEvent {
  List<String> listData;
  DefaultCategoriesFetch({required this.listData});
  @override
  // TODO: implement props
  List<Object?> get props => [listData];
}
