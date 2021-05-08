// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkCatImage _$NetworkCatImageFromJson(Map<String, dynamic> json) {
  return NetworkCatImage(
    json['id'] as String,
    json['url'] as String,
    (json['breeds'] as List<dynamic>)
        .map((e) => NetworkBreed.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['original_filename'] as String?,
    json['created_at'] as String?,
    json['width'] as int,
    json['height'] as int,
    json['breed_ids'] as String?,
    json['sub_id'] as String?,
  );
}

Map<String, dynamic> _$NetworkCatImageToJson(NetworkCatImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'sub_id': instance.subId,
      'original_filename': instance.originalFilename,
      'breed_ids': instance.breedIds,
      'created_at': instance.createdAt,
      'breeds': instance.breeds,
    };
