import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reading_modes.g.dart';

@JsonSerializable()
class ReadingModes extends Equatable {
  final bool? text;
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return _$ReadingModesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);

  ReadingModes copyWith({
    bool? text,
    bool? image,
  }) {
    return ReadingModes(
      text: text ?? this.text,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [text, image];
}
