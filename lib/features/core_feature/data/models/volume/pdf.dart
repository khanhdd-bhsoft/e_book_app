import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pdf.g.dart';

@JsonSerializable()
class Pdf extends Equatable {
  final bool? isAvailable;
  final String? acsTokenLink;

  const Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);

  Pdf copyWith({
    bool? isAvailable,
    String? acsTokenLink,
  }) {
    return Pdf(
      isAvailable: isAvailable ?? this.isAvailable,
      acsTokenLink: acsTokenLink ?? this.acsTokenLink,
    );
  }

  @override
  List<Object?> get props => [isAvailable, acsTokenLink];
}
