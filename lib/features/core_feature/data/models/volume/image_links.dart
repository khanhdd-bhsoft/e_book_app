import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_links.g.dart';

@JsonSerializable()
class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String? thumbnail;

  final String? medium;
  final String? small;
  final String? large;

  const ImageLinks(
      {this.smallThumbnail,
      this.thumbnail,
      this.large,
      this.medium,
      this.small});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return _$ImageLinksFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);

  ImageLinks copyWith(
      {String? smallThumbnail,
      String? thumbnail,
      String? medium,
      String? small,
      String? large}) {
    return ImageLinks(
      smallThumbnail: smallThumbnail ?? this.smallThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      large: thumbnail ?? this.thumbnail,
      small: small ?? this.small,
      medium: medium ?? this.medium,
    );
  }

  @override
  List<Object?> get props => [smallThumbnail, thumbnail, medium, small, large];
}
