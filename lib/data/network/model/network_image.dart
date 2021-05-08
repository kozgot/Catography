import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'network_breed.dart';

part 'network_image.g.dart';

@immutable
@JsonSerializable()
class NetworkCatImage {
  final String id;
  final String url;

  final int width;
  final int height;

  @JsonKey(name: "sub_id")
  final String subId;

  @JsonKey(name: "original_filename")
  final String originalFilename;

  @JsonKey(name: "breed_ids")
  final String breedIds;

  @JsonKey(name: "created_at")
  final String createdAt;

  final List<NetworkBreed> breeds;

  NetworkCatImage(
      this.id,
      this.url,
      this.breeds,
      this.originalFilename,
      this.createdAt,
      this.width,
      this.height,
      this.breedIds,
      this.subId
      );

  static const fromJsonFactory = _$NetworkCatImageFromJson;

  factory NetworkCatImage.fromJson(Map<String, dynamic> json) => _$NetworkCatImageFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkCatImageToJson(this);
}