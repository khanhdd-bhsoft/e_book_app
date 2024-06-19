// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageLinks _$ImageLinksFromJson(Map<String, dynamic> json) => ImageLinks(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
    );

Map<String, dynamic> _$ImageLinksToJson(ImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
      'medium': instance.medium,
      'small': instance.small,
      'large': instance.large,
    };
