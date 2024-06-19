import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_info.g.dart';

@JsonSerializable()
class SearchInfo extends Equatable {
  final String? textSnippet;

  const SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) {
    return _$SearchInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);

  SearchInfo copyWith({
    String? textSnippet,
  }) {
    return SearchInfo(
      textSnippet: textSnippet ?? this.textSnippet,
    );
  }

  @override
  List<Object?> get props => [textSnippet];
}
