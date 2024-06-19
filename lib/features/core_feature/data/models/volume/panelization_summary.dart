import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'panelization_summary.g.dart';

@JsonSerializable()
class PanelizationSummary extends Equatable {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  const PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return _$PanelizationSummaryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);

  PanelizationSummary copyWith({
    bool? containsEpubBubbles,
    bool? containsImageBubbles,
  }) {
    return PanelizationSummary(
      containsEpubBubbles: containsEpubBubbles ?? this.containsEpubBubbles,
      containsImageBubbles: containsImageBubbles ?? this.containsImageBubbles,
    );
  }

  @override
  List<Object?> get props => [containsEpubBubbles, containsImageBubbles];
}
