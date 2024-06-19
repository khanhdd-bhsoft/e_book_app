import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'volume.g.dart';

@JsonSerializable()
class Volume extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  const Volume({this.kind, this.totalItems, this.items});

  factory Volume.fromJson(Map<String, dynamic> json) {
    return _$VolumeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VolumeToJson(this);

  Volume copyWith({
    String? kind,
    int? totalItems,
    List<Item>? items,
  }) {
    return Volume(
      kind: kind ?? this.kind,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [kind, totalItems, items];
}
