import 'package:e_book/features/core_feature/data/models/volume_model.dart';
import 'package:equatable/equatable.dart';

class VolumesModel extends Equatable {
  final String? kind;
  final int? totalItems;
  final List<VolumeModel>? items;
  VolumesModel({this.items, this.kind, this.totalItems});
  factory VolumesModel.fromJson(Map<String, dynamic> json) => VolumesModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: json["items"] != null
            ? List<VolumeModel>.from(
                json["items"].map((x) => VolumeModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": items != null
            ? List<dynamic>.from(items!.map((x) => x.toJson()))
            : null,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [totalItems, items, kind];
}
