import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'epub.g.dart';

@JsonSerializable()
class Epub extends Equatable {
  final bool? isAvailable;

  const Epub({this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);

  Epub copyWith({
    bool? isAvailable,
  }) {
    return Epub(
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  List<Object?> get props => [isAvailable];
}
